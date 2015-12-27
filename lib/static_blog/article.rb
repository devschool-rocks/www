require 'yaml'

Article = Struct.new(:markdown, :meta) do

  def self.from_markdown(src)
    new(*extract_data(src))
  end

  def self.from_manifest
    manifest = "#{Rails.root}/lib/static_blog/manifest.yml"
    YAML.load(File.read(manifest))
  end

  def permalink
    meta[:permalink]
  end

  def title
    meta[:title]
  end

  def author
    meta[:author]
  end

  def image_url
    meta[:image_url]
  end

  def image_height
    meta[:image_height]
  end

  def image_width
    meta[:image_width]
  end

  def published_at
    meta[:published_at]
  end

  def updated_at
    meta[:updated_at]
  end

private

  def self.extract_data(src)
    meta = src.match(/(---\n((.|\n)*)---\n)/)
    markdown = src.sub(meta[0], '')
    [ markdown, to_hash(meta[2]) ]
  end

  def self.to_hash(str)
    str.split(/\n/).reduce({}) do |hash, attr|
      key, value = attr.split(": ").map(&:strip)
      hash[key.to_sym] = value
      hash
    end
  end
end
