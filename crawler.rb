require "anemone"

options = {
  user_agent: "AnemoneCrawler/0.0.1",
  delay: 1,
  depth_limit: 1,
  # :storage => Anemone::Storage.MongoDB,
}

url = "https://bs.serendip-service.com/otx/books"
url = "https://www.d-wood.com/blog/2014/01/24_5332.html"

Anemone.crawl(url, options) do |anemone|
  # クロールするごとに呼び出される
  # anemone.focus_crawl do |page|
  #   # 条件に一致するリンクだけ残す
  #   # この `links` はanemoneが次にクロールする候補リスト
  #   page.links.keep_if { |link|
  #     link.to_s.match(/detail/)
  #   }
  # end
  anemone.on_every_page do |page|
    puts page.url.to_s
  end
  # anemone.focus_crawl do |page|
  #   page.links.keep_if { |link|
  #     link.to_s.match(/test/)
  #   }
  # end
  # anemone.on_every_page do |page|
  #   if page.doc
  #     p page.url.to_s
  #     p page.doc.at('title').inner_html
  #   end
  # end
end
