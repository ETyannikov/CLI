require_relative "../lib/stonks.rb"
require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  def self.stockmarket(target)
    target -= 1
    site = Nokogiri::HTML(open("https://money.cnn.com/data/markets/"))

    column = site.css("ul.three-equal-columns.wsod li")[target]
    hash = {
      :name => column.css("a span.ticker-name").text,
      :percent => column.css("a span.ticker-name-change span").text,
      :points => column.css("a span.ticker-points-change span").text,
      :total => column.css("a span.ticker-points").text
    }
  hash
  end
  
  def self.top_stocks
    site = Nokogiri::HTML(open("https://money.cnn.com/data/hotstocks/index.html"))
    
    table = site.css("table.wsod_dataTable.wsod_dataTableBigAlt tr")
    table.css("td").each do |item|
    name = item.css("span").text
    binding.pry
    end
    site 
  end
top_stocks
end

