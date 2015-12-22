xml.instruct! :xml, :version => "1.0"
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  xml.url do
    xml.loc "https://devschool.rocks"
    xml.lastmod 2.days.ago.to_date
    xml.changefreq "weekly"
    xml.priority "0.8"
  end

  xml.url do
    xml.loc "https://devschool.rocks/how"
    xml.lastmod 2.days.ago.to_date
    xml.changefreq "weekly"
    xml.priority "0.8"
  end

  xml.url do
    xml.loc "https://devschool.rocks/who"
    xml.lastmod 2.days.ago.to_date
    xml.changefreq "weekly"
    xml.priority "0.8"
  end

  xml.url do
    xml.loc "https://devschool.rocks/where"
    xml.lastmod 2.days.ago.to_date
    xml.changefreq "weekly"
    xml.priority "0.8"
  end

  xml.url do
    xml.loc "https://devschool.rocks/price"
    xml.lastmod 2.days.ago.to_date
    xml.changefreq "weekly"
    xml.priority "0.8"
  end

  xml.url do
    xml.loc "https://devschool.rocks/apply"
    xml.lastmod 2.days.ago.to_date
    xml.changefreq "weekly"
    xml.priority "0.8"
  end
end
