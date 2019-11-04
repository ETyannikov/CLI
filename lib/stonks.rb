class Stocks
  attr_accessor :nasDac, :dow, :sAndp, :hotStocks
  
  def initialize(array)
    @nasDac = array[0]
    @dow = array[1]
    @sAndp = array[2]
    @hotStocks = array[3]
  end
end