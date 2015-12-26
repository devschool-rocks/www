require 'html/pipeline'
require 'erb'
require 'yaml'

require 'static_blog/article'

module StaticBlog
  extend self

  def build
    clobber
    generate
  end

private

  def write_path
    "#{Rails.root}/app/views/blog"
  end

  def source_files
    Dir["#{Rails.root}/articles/*.md"]
  end

  def manifest_file
    "#{Rails.root}/lib/static_blog/manifest.yml"
  end

  def generate
    articles = source_files.map do |src|
      article = Article.from_markdown(File.read(src))
      write_html(article, src)
      article[:meta]
    end

    write_manifest(articles)
  end

  def write_manifest(articles)
    File.write manifest_file, articles.to_yaml
  end

  def path(src)
    "#{write_path}/#{permalink(src)}"
  end

  def write_html(article, src)
    html = [meta_to_html(article.meta),
            md_to_html(article.markdown)].join

    File.write("#{write_path}/_#{permalink(src)}.html.erb", html)
    article
  end

  def permalink(src)
    src.split("/")[-1].gsub(".md","").gsub("-","_")
  end

  def meta_to_html(meta)
    meta.map {|key, value| tag(key, value) }.join("\n")
  end

  def tag(key, value)
    send("#{key}_tag", value)
  end

  def permalink_tag(val)
  end

  def title_tag(title)
    "<h1 itemprop='headline'>#{title}</h1>"
  end

  def author_tag(name)
    <<-EOS
<h3 class="article author" itemprop="author" itemscope
    itemtype="https://schema.org/Person">
  By <span itemprop="name">#{name}</span>
</h3>
EOS
  end

  def avatar_tag(url)
    <<-EOS
<div itemprop="image" itemscope
     itemtype="https://schema.org/ImageObject">
  <img src="#{url}" class="img-circle img-responsive avatar"
       align=left hspace=12 vspace=12 />
  <meta itemprop="url" content="#{url}">
  <meta itemprop="width" content="120">
  <meta itemprop="height" content="120">
</div>
EOS
  end

  def description_tag(description)
    <<-EOS
<span itemprop="description">#{description}</span>
EOS
  end

  def role_tag(role)
    "<div class='article author role'>#{role}</div>"
  end

  def published_at_tag(timestamp)
    "<meta itemprop='datePublished' content='#{timestamp}' />"
  end

  def updated_at_tag(timestamp)
    <<-EOS
<meta itemprop='dateModified' content='#{timestamp}' />
<div class="article timestamp">Last updated on #{timestamp}</div>
EOS
  end

  def md_to_html(md)
    pipeline = HTML::Pipeline.new([
      HTML::Pipeline::MarkdownFilter,
      HTML::Pipeline::SyntaxHighlightFilter
    ])
    pipeline.call(md)[:output].to_s
  end

  def clobber
    `rm -rf #{write_path}/_*`
    `rm -rf #{manifest_file}`
  end
end
