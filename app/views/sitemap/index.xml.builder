xml.instruct! :xml, :version => "1.0"
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do

  xml.url do
    xml.loc "https://devschool.rocks"
    xml.changefreq "weekly"
    xml.priority "1.0"
  end

  xml.url do
    xml.loc "https://devschool.rocks/how"
    xml.changefreq "weekly"
    xml.priority "0.8"
  end

  xml.url do
    xml.loc "https://devschool.rocks/who"
    xml.changefreq "weekly"
    xml.priority "0.8"
  end

  xml.url do
    xml.loc "https://devschool.rocks/where"
    xml.changefreq "weekly"
    xml.priority "0.6"
  end

  xml.url do
    xml.loc "https://devschool.rocks/price"
    xml.changefreq "weekly"
    xml.priority "0.8"
  end

  xml.url do
    xml.loc "https://devschool.rocks/apply"
    xml.changefreq "weekly"
    xml.priority "0.8"
  end

  xml.url do
    xml.loc "https://devschool.rocks/ngo-program"
    xml.changefreq "weekly"
    xml.priority "0.5"
  end

  xml.url do
    xml.loc "https://devschool.rocks/blog"
    xml.changefreq "daily"
    xml.priority "0.5"
  end

  ARTICLES.each do |a|
    xml.url do
      xml.loc "https://devschool.rocks/blog/#{a[:permalink]}"
      xml.lastmod a[:updated_at]
      xml.changefreq "weekly"
      xml.priority "0.5"
    end
  end

end
