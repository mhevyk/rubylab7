require 'bigdecimal'
require 'bigdecimal/util'

puts "Привіт, Максим Гевик"

class Money
  public def initialize(grivnas, coins)
    @grivnas = BigDecimal(grivnas.to_s)
    @coins = coins.to_i
    normalize
  end

  protected def grivnas
    @grivnas
  end

  protected def grivnas=(value)
    @grivnas = value
  end

  protected def coins
    @coins
  end

  protected def coins=(value)
    @coins = value
  end

  public def to_s
    "#{@grivnas.to_i} гривень, #{@coins.to_s.rjust(2, '0')} копійок"
  end

  public def +(other)
    new_grivnas = @grivnas + other.grivnas
    new_coins = @coins + other.coins
    Money.new(new_grivnas, new_coins)
  end

  public def -(other)
    total_coins_self = (@grivnas * 100 + @coins).to_i
    total_coins_other = (other.grivnas * 100 + other.coins).to_i

    if total_coins_self < total_coins_other
      raise "Сума грошей не може бути від'ємною"
    end

    new_total_coins = total_coins_self - total_coins_other
    Money.new(new_total_coins / 100, new_total_coins % 100)
  end

  public def /(value)
    if value.zero?
      raise "Ділення на нуль"
    end

    total_coins = (@grivnas * 100 + @coins).to_i
    new_total_coins = (total_coins.to_f / value).round
    Money.new(new_total_coins / 100, new_total_coins % 100)
  end

  public def *(value)
    total_coins = (@grivnas * 100 + @coins).to_i
    new_total_coins = (total_coins * value).round
    Money.new(new_total_coins / 100, new_total_coins % 100)
  end

  private def normalize
    if @coins >= 100
      additional_grivnas = @coins / 100
      @grivnas += additional_grivnas
      @coins = @coins % 100
    end
  end
end

money1 = Money.new(10, 50)
money2 = Money.new(5, 75)

puts "Сума: #{money1 + money2}"
puts "Різниця: #{money1 - money2}"
puts "Ділення: #{money1 / 2.5}"
puts "Множення: #{money1 * 1.5}"
