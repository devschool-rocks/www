xml.instruct! :xml, :version => "1.0"
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do

  xml.url do
    xml.loc "https://devschool.rocks/online-bootcamp"
  end

  xml.url do
    xml.loc "https://devschool.rocks/online-bootcamp/who"
  end

  xml.url do
    xml.loc "https://devschool.rocks/online-bootcamp/price"
  end

  xml.url do
    xml.loc "https://devschool.rocks/online-bootcamp/apply"
  end

  xml.url do
    xml.loc "https://devschool.rocks/ngo-program"
  end

  xml.url do
    xml.loc "https://devschool.rocks/blog"
  end

  ARTICLES.each do |a|
    xml.url do
      xml.loc "https://devschool.rocks/blog/#{a[:permalink]}"
      xml.lastmod Date.parse(a[:updated_at]).to_s
    end
  end

end
