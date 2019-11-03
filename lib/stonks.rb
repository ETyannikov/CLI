class Stocks
  attr_accessor :NasDac, :Dow, :SandP, :HotStocks
  
  def initialize(hash)
      student_hash.each {|key, value| self.send(("#{key}="), value)}
  end
end