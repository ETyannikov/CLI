class Stocks
  attr_accessor :name, :points, :percent, :total
  
  def initialize(hash)
    hash.each {|key, value| self.send(("#{key}="), value)}
  end
end