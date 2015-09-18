# assignment: https://www.gotealeaf.com/lessons/f4d7b093/assignments/1653
# create the deck
# define game play
  # player draws
  # ask player Stand or Hit
  # perform Stand or Hit
  # sum the cards



# create the deck
deck_suits = ["clubs", "diamonds", "hearts", "spades"]
deck_numbers = ["J", "Q", "K", "A"]
deck = []

(2..10).each do |num| 
  deck_numbers << num
end

deck_suits.each do |suit|
  deck_numbers.each do |num|
    deck << "#{num} #{suit.capitalize}"
  end
end

puts deck