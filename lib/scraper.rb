require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
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
    
    table = site.css("table.wsod_dataTable.wsod_dataTableBigAlt tr")
    group = []
    counter = 1
    hash = {}
    table.css("td").each do |item|
      name = item.css("span span.posData").text
      name = item.css("span span.negData").text if name == ""
      name = item.css("span").text if name == ""
      case counter
        when 1
          hash[:name] = name
        when 2
          hash[:total] = name
        when 3
          hash[:points] = name
        when 4
          hash[:percent] = name
          counter = 0
          group << hash
          hash = {}
      end #case loop
      counter += 1
    end #each loop
    group
  end
end

