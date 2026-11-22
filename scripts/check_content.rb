#!/usr/bin/env ruby
# Validate the editable content before Jekyll builds it. No extra gems required.
# Usage: ruby scripts/check_content.rb
require "yaml"
require "date"
require "uri"
require "pathname"

class ContentCheck
  PUBLICATION_CATEGORIES = %w[international preprint domestic].freeze

  def initialize(root)
    @root = root
    @errors = []
    @counts = {}
  end

  def error(where, message)
    @errors << "#{where}: #{message}"
  end

  def load_file(name)
    value = YAML.safe_load(@root.join(name).read, permitted_classes: [], permitted_symbols: [], aliases: false)
    error(name, "file is empty") if value.nil?
    value
  rescue Psych::Exception => e
    error(name, "invalid YAML (quote YYYY-MM-DD dates and use spaces for indentation): #{e.message}")
    nil
  rescue SystemCallError => e
    error(name, e.message)
    nil
  end

  def mapping(value, where)
    return true if value.is_a?(Hash)
    error(where, "must be a mapping of field names to values")
    false
  end

  def string(value, where, optional: false)
    return true if optional && value.nil?
    return true if value.is_a?(String) && (optional || !value.strip.empty?)
    error(where, optional ? "must be text when provided" : "must be nonempty text")
    false
  end

  def strings(value, where, empty: false)
    unless value.is_a?(Array) && (empty || !value.empty?)
      error(where, "must be #{empty ? 'a' : 'a nonempty'} list of text values")
      return
    end
    value.each_with_index { |item, i| string(item, "#{where}[#{i + 1}]") }
  end

  def boolean(value, where)
    error(where, "must be true or false (without quotes)") unless value == true || value == false
  end

  def date(value, where)
    return unless string(value, where)
    unless value.match?(/\A\d{4}-\d{2}-\d{2}\z/)
      error(where, 'must use a quoted date such as "2026-09-29"')
      return
    end
    Date.iso8601(value)
  rescue Date::Error
    error(where, "is not a valid calendar date")
    nil
  end

  def url(value, where, optional: false, published: true)
    return if optional && (value.nil? || value == "")
    return unless string(value, where)
    if value.match?(/\s/) || value.start_with?("//") || value == "#"
      error(where, "must be a complete HTTPS, mailto, or local URL without spaces")
      return
    end
    parsed = URI.parse(value)
    case parsed.scheme
    when "https"
      error(where, "HTTPS URL needs a host name") if parsed.host.nil? || parsed.host.empty?
    when "mailto"
      error(where, "mailto URL needs an email address") unless parsed.opaque.to_s.match?(/\A[^@?\s]+@[^@?\s]+\.[^@?\s]+(?:\?.*)?\z/)
    when nil
      error(where, "local URLs must not traverse parent directories") if parsed.path.to_s.split("/").include?("..")
    else
      error(where, "unsupported URL scheme #{parsed.scheme.inspect}; use HTTPS, mailto, or a local path")
    end
    if published && (parsed.host.to_s.match?(/(?:\A|\.)example\.(?:com|org|net)\z/i) || value.match?(/YOUR_(?:REAL_ID|ACCOUNT|REPOSITORY|URL)|REPLACE_ME|PLACEHOLDER|<[^>]+>/i))
      error(where, "replace the placeholder URL before publishing")
    end
  rescue URI::InvalidURIError
    error(where, "is not a valid URL; encode spaces or special characters")
  end

  def links(value, where, published: true)
    unless value.is_a?(Array)
      error(where, "must be a list; use [] when no links are available")
      return
    end
    value.each_with_index do |item, i|
      at = "#{where}[#{i + 1}]"
      next unless mapping(item, at)
      string(item["label"], "#{at}.label")
      url(item["url"], "#{at}.url", published: published)
    end
  end

  def markdown_links(text, where, published: true)
    return unless text.is_a?(String)
    text.scan(/\[[^\]]*\]\(([^\s)]+)(?:\s+"[^"]*")?\)/).flatten.each do |link|
      url(link, "#{where} link", published: published)
    end
  end

  def local_image(value, where, optional: false)
    return if optional && (value.nil? || value == "")
    return unless string(value, where)
    path = @root.join(value.sub(%r{\A/}, "")).cleanpath
    unless path.to_s.start_with?(@root.to_s + File::SEPARATOR) && path.file?
      error(where, "local image does not exist: #{value}")
    end
  end

  def entries(name)
    where = "_data/#{name}.yml"
    data = load_file(where)
    return if data.nil?
    unless data.is_a?(Array)
      error(where, "must contain a YAML list")
      return
    end
    @counts[name] = data.length
    data.each_with_index do |item, i|
      at = "#{where}[#{i + 1}]"
      yield item, at if mapping(item, at)
    end
  end

  def badge(value, where, label: false)
    return unless mapping(value, where)
    string(value["label"], "#{where}.label") if label
    %w[background text border].each do |key|
      color = value[key]
      unless color.is_a?(String) && color.match?(/\A#[0-9a-fA-F]{6}\z/)
        error("#{where}.#{key}", 'must be a quoted six-digit hex color, e.g. "#475569"')
      end
    end
  end

  def publication_settings
    at = "_data/publication_settings.yml"
    settings = load_file(at)
    return if settings.nil?
    return unless mapping(settings, at)

    groups = settings["groups"]
    if groups.is_a?(Array)
      seen = {}
      groups.each_with_index do |group, i|
        group_at = "#{at}.groups[#{i + 1}]"
        next unless mapping(group, group_at)
        id = group["id"]
        string(group["title"], "#{group_at}.title")
        unless PUBLICATION_CATEGORIES.include?(id)
          error("#{group_at}.id", "must be one of #{PUBLICATION_CATEGORIES.join(', ')}")
          next
        end
        error("#{group_at}.id", "duplicates #{seen[id]}; each category must appear once") if seen.key?(id)
        seen[id] = group_at
      end
      (PUBLICATION_CATEGORIES - seen.keys).each do |id|
        error("#{at}.groups", "is missing the #{id.inspect} category; each category must appear once")
      end
    else
      error("#{at}.groups", "must be a list containing international, preprint, and domestic once each")
    end

    badge(settings["default_badge"], "#{at}.default_badge")
    badge(settings["preprint_badge"], "#{at}.preprint_badge", label: true)
    if mapping(settings["venues"], "#{at}.venues")
      settings["venues"].each do |venue, colors|
        next unless string(venue, "#{at}.venues key")
        badge(colors, "#{at}.venues.#{venue}")
      end
    end
  end

  def run
    config = load_file("_config.yml")
    if config && mapping(config, "_config.yml")
      %w[title description url].each { |key| string(config[key], "_config.yml.#{key}") }
      url(config["url"], "_config.yml.url")
      baseurl = config["baseurl"]
      unless baseurl.is_a?(String) && (baseurl.empty? || baseurl.match?(%r{\A/(?!/)[^\s?#]*[^/\s?#]\z}))
        error("_config.yml.baseurl", 'must be "" or a path such as "/my-project" without a trailing slash')
      end
    end

    profile = load_file("_data/profile.yml")
    if profile && mapping(profile, "_data/profile.yml")
      at = "_data/profile.yml"
      %w[name role email image_alt].each { |key| string(profile[key], "#{at}.#{key}") }
      url("mailto:#{profile['email']}", "#{at}.email") if profile["email"].is_a?(String)
      local_image(profile["image"], "#{at}.image")
      local_image(profile["image_webp"], "#{at}.image_webp", optional: true)
      strings(profile["bio"], "#{at}.bio")
      Array(profile["bio"]).each { |text| markdown_links(text, "#{at}.bio") }
      strings(profile["interests"], "#{at}.interests")
      links(profile["links"], "#{at}.links")
      if mapping(profile["affiliation"], "#{at}.affiliation")
        %w[institution school lab advisor].each { |key| string(profile["affiliation"][key], "#{at}.affiliation.#{key}") }
      end
    end

    publication_settings
    ids = {}
    entries("publications") do |item, at|
      %w[id title venue].each { |key| string(item[key], "#{at}.#{key}") }
      id = item["id"]
      if id.is_a?(String)
        error("#{at}.id", "use a lowercase slug, e.g. my-paper-2026") unless id.match?(/\A[a-z0-9]+(?:-[a-z0-9]+)*\z/)
        error("#{at}.id", "duplicates #{ids[id]}") if ids.key?(id)
        ids[id] = at
      end
      published = item["published"]
      boolean(published, "#{at}.published")
      error("#{at}.category", "must be one of #{PUBLICATION_CATEGORIES.join(', ')}") unless PUBLICATION_CATEGORIES.include?(item["category"])
      year = item["year"]
      error("#{at}.year", "must be a four-digit integer") unless year.is_a?(Integer) && year.between?(1000, 9999)
      date(item["date"], "#{at}.date")
      strings(item["authors"], "#{at}.authors")
      %w[summary highlight bibtex image_alt].each { |key| string(item[key], "#{at}.#{key}", optional: true) }
      local_image(item["image"], "#{at}.image", optional: true)
      links(item["links"], "#{at}.links", published: published != false)
    end

    entries("news") do |item, at|
      date(item["date"], "#{at}.date")
      string(item["text"], "#{at}.text")
      boolean(item["published"], "#{at}.published")
      markdown_links(item["text"], "#{at}.text", published: item["published"] != false)
    end

    %w[education experience].each do |name|
      entries(name) do |item, at|
        %w[title organization period].each { |key| string(item[key], "#{at}.#{key}") }
        url(item["url"], "#{at}.url", optional: true)
        strings(item["details"], "#{at}.details", empty: true)
        Array(item["details"]).each { |text| markdown_links(text, "#{at}.details") }
      end
    end

    unless @errors.empty?
      warn "Content validation failed (#{@errors.length} issues):"
      @errors.each { |message| warn "  - #{message}" }
      return 1
    end
    puts "Content validation passed: #{@counts.map { |name, count| "#{count} #{name}" }.join(', ')}."
    0
  end
end

exit ContentCheck.new(Pathname.new(__dir__).parent.expand_path).run
