require_relative "../lib/stonks.rb"
require 'nokogiri'
require 'open-uri'
require 'pry'

class Scaper
  def self.stockmarket(target)
    target = target.to_i
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
    
    site 
  end

end