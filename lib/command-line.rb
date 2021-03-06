require_relative "../lib/stonks.rb"
require_relative "../lib/scraper.rb"
require 'pry'
class Command
  
  def initialize
    call
  end
  
  #input loop
  def call
  puts "Howdy!"
  puts "Type 1 for Dow, 2 for Nasdaq, or 3 for S&P"
  puts "For all 3, type all"
  puts "To see the most active stocks, type active"
  puts "To exit, type exit"
  @input = gets.chomp
    until @input == "exit"
      case @input
        when "1"
          present(scrape(@input))
          puts "-----------------------------------"
        when "2"
          present(scrape(@input))
          puts "-----------------------------------"
        when "3"
          present(scrape(@input))
          puts "-----------------------------------"
        when "all"
          present(scrape(1))
          present(scrape(2))
          present(scrape(3))
          puts "-----------------------------------"
        when "active"
          active
        else
          puts "Invalid input"
      end #case
      @input = gets.chomp
    end #until
  end #call
  
  def present(stock)
    puts "-----------------------------------"
    puts "#{stock.name} #{stock.percent}"
    puts "#{stock.total} / #{stock.points}"
  end
    
  def scrape(target)
    scrape1 = Scraper.stockmarket(target)
    stocks = Stocks.new(scrape1)
    stocks
  end
  
  def active
    scrape = Scraper.top_stocks
    scrape.each do |stock|
      toPresent = Stocks.new(stock)
      present(toPresent)
    end #each loop
    puts "-----------------------------------"
  end # active method
end
