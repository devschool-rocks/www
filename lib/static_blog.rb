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
      write_excerpt(article, src)
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

  def write_excerpt(article, src)
    html = [meta_to_html(article.meta),
            md_to_html(first_section(article.markdown)),
            read_more_button(article.permalink)].join

    File.write("#{write_path}/_#{permalink(src)}_excerpt.html.erb", html)
  end

  def read_more_button(permalink)
    <<-EOS
    <p class="text-center">
<a href="/blog/#{permalink}" class="btn btn-primary btn-read-more">
Keep reading <i class="fa fa-angle-double-right"></i></a>
</p>
EOS
  end

  def first_section(str)
    stop = str.index("## ")
    str[0, stop]
  end

  def write_html(article, src)
    html = [meta_to_html(article.meta),
            article_json_ld(article),
            md_to_html(article.markdown),
            share_buttons(permalink(src))].join

    File.write("#{write_path}/_#{permalink(src)}.html.erb", html)
    article
  end

  def permalink(src)
    src.split("/")[-1].gsub(".md","").gsub("-","_")
  end

  def meta_to_html(meta)
    [ blog_js,
      title_tag(meta[:title], meta[:permalink]),
      avatar_tag(meta[:avatar]),
      author_tag(meta[:author]),
      role_tag(meta[:role]),
      published_at_tag(meta[:published_at]),
      updated_at_tag(meta[:updated_at]),
      share_buttons(meta[:permalink])
    ]
  end

  def blog_js
    <<-EOS
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
EOS
  end

  def share_buttons(permalink)
    <<-EOS
        <ul class="list-inline">
        <li>
          <div class="fb-like" data-href="https://devschool/blog/#{permalink}"
                               data-layout="button" data-action="like"
                               data-show-faces="false" data-share="false"></div>
        </li>
        <li>
          <a href="https://twitter.com/share"
             class="twitter-share-button"{count}
             data-via="devschoolrocks">Share</a>
        </li>
        <li>
          <g:plusone size="medium" annotation="none"></g:plusone>
        </li>
        </ul>
EOS
  end

  def tag(key, value)
    send("#{key}_tag", value)
  end

  def permalink_tag(val)
  end

  def title_tag(title, permalink)
    <<-EOS
<a href="/blog/#{permalink}">
  <h1>#{title}</h1>
</a>
EOS
  end

  def author_tag(name)
    <<-EOS
<h3 class="author name">By #{name}</h3>
EOS
  end

  def avatar_tag(url)
    <<-EOS
<div class="author">
  <img src="#{url}" class="img-circle img-responsive avatar"
       align=left hspace=12 vspace=12 />
</div>
EOS
  end

  def role_tag(role)
    "<div class='article author role'>#{role}</div>"
  end

  def published_at_tag(timestamp)
  ""
  end

  def updated_at_tag(timestamp)
    <<-EOS
<div class="article timestamp">Last updated on #{timestamp}</div>
EOS
  end

  def article_json_ld(article)
  <<-EOS
<script type="application/ld+json">
{
  "@context": "http://schema.org",
  "@type": "Article",
  "mainEntityOfPage":{
    "@type":"WebPage",
    "@id":"https://devschool/.rocks/blog/#{article.permalink}"
  },
  "headline": "#{article.title}",
  "image": {
    "@type": "ImageObject",
    "url": "#{article.image_url}",
    "height": #{article.image_height},
    "width": #{article.image_width}
  },
  "datePublished": "#{article.published_at}",
  "dateModified": "#{article.updated_at}",
  "author": {
    "@type": "Person",
    "name": "#{article.author}"
  },
   "publisher": {
    "@type": "Organization",
    "name": "Devschool",
    "logo": {
      "@type": "ImageObject",
      "url": "https://s3.amazonaws.com/devschool-shared/large-square-red.png",
      "width": 200,
      "height": 200
    }
  }
}
</script>
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
