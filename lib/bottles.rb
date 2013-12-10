class BottlesSong
  def sing
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map {|n| verse(n) + "\n"}.join
  end

  def verse(n)
    Verse.new(n).lyrics
  end

end

class Verse
  attr_reader :number, :fork
  
  def initialize(verse_number)
    @number = verse_number
    @fork = Fork.new(number)
  end
  
  def lyrics
    "#{fork.count} #{fork.container} of #{liquid} #{location}, ".capitalize +
    "#{fork.count} #{fork.container} of #{liquid}.\n" +
    "#{fork.action}, " +
    "#{fork.second_count} #{fork.second_container} of #{liquid} #{location}.\n"
  end

  def liquid
    'beer'
  end

  def location
    'on the wall'
  end
end

class Fork
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def tine(boolean, first_option, second_option)
    boolean ? first_option : second_option
  end
  
  def action
    tine(number == 0, "Go to the store and buy some more", "Take #{pronoun} down and pass it around")
  end

  def count
    tine(number == 0, 'no more', number)
  end

  def second_count
    tine(number == 1, 'no more',  (number-1)%100 )
  end
  
  def container
    tine(number == 1,'bottle', 'bottles')
  end
  
  def second_container
    tine(number == 2, 'bottle', 'bottles')
  end

  def pronoun
    tine(number == 1, 'it', 'one')
  end
end