require 'nokogiri'
require 'open-uri'
require 'pry'

class Scapper
  def self.stockmarket(target)
    site = Nokogiri::HTML(open("https://money.cnn.com/data/markets/")
    
    site.css("ul.three-equal-columns wsod").each do |stock|
    
    end
    
  end
  def self.top_stocks
    site = Nokogiri::HTML(open("https://money.cnn.com/data/hotstocks/index.html")
    
    site 
  end
end