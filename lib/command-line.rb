require_relative "../lib/stonks.rb"
require_relative "../lib/scraper.rb"
require 'pry'
class Command
  attr_accessor :last, :input
  
  #input loop
  def self.call
  @input = gets
    until @input == "exit"
      case @input
        when "1"
          puts scrape("1")
      end #case
      @input = gets
    end #until
  end #call
    
  def scrape(target)
    stocks = Stocks.new(Scraper.stockmarket(target))
    stocks
  end
  
  #scrape top 5 stocks
  #scrape all
  #update info(repeats last action)
  
  call
end