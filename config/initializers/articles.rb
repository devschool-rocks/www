require 'static_blog/article'
if File.exists?("#{Rails.root}/lib/static_blog/manifest.yml")
  ARTICLES = Article.from_manifest
end
