desc "build statuc blof partials"
task "blog:build" => :environment do
  require 'static_blog'
  StaticBlog.build
end
