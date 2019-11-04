require_relative "../lib/stonks.rb"
require_relative "../lib/scraper.rb"
require 'pry'
class Command
  attr_accessor :last
  
  def initialize
    call
  end
  
  #input loop
  def call
  @input = gets.chomp
    until @input == "exit"
      case @input
        when "1"
          present(scrape(@input))
        when "2"
          present(scrape(@input))
        when "3"
          present(scrape(@input))
        when "pry"
          binding.pry
      end #case
      @input = gets.chomp
    end #until
  end #call
  
  def present(stock)
    puts "#{stock.name} #{stock.percent}"
    puts "#{stock.total} / #{stock.percent}"
  end
    
  def scrape(target)
    scrape = Scraper.stockmarket(target)
    stocks = Stocks.new(Scraper.stockmarket(target))
    stocks
  end
  
  #scrape top 5 stocks
  #scrape all
  #update info(repeats last action)

end

Command.new