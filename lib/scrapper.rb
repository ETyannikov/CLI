require_relative "../lib/stonks.rb"
require 'nokogiri'
require 'open-uri'
require 'pry'

class Scapper
  def self.stockmarket
    site = Nokogiri::HTML(open("https://money.cnn.com/data/markets/"))

    column = site.css("ul.three-equal-columns.wsod li").first
    percent = column.css("a span.ticker-name-change span").text
    points = column.css("a span.ticker-points-change span").text
    total = column.css("a span.ticker-points").text
    binding.pry

  end
  def self.top_stocks
    site = Nokogiri::HTML(open("https://money.cnn.com/data/hotstocks/index.html"))
    
    site 
  end
  stockmarket
end