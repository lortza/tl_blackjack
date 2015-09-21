# assignment: https://www.gotealeaf.com/lessons/f4d7b093/assignments/1653
# create the deck
# define game play
  # shuffle the deck
  # player draws
  # ask player Stand or Hit
  # perform Stand or Hit
  # sum the cards

# arrays needed to create_deck
@deck_suits = ["clubs", "diamonds", "hearts", "spades"]
@deck_numbers = ["J", "Q", "K", "A"]
@deck = []

# arrays needed for totals and play actions
dealer_visible_total = []
dealer_hidden_total = []
player_total = []

# methods to create a deck with names and values
class String
  def is_integer?
    self.to_i.to_s == self
  end
end


def create_deck
  (2..10).each do |num| 
    @deck_numbers << num
  end

  @deck_suits.each do |suit|
    @deck_numbers.each do |num|
      if num == "A"
        @deck << {name: "#{num} #{suit.capitalize}", value: "ACE" }
      elsif num == "J" || num == "Q" || num == "K"
        @deck << {name: "#{num} #{suit.capitalize}", value: 10 }
      else 
        @deck << {name: "#{num} #{suit.capitalize}", value: num }
      end#if
    end#each
  end#each
end#create_deck

create_deck
puts @deck


# methods for play actions
def dealer_hit

end#dealer_hit


def player_hit

end#player_hit


def stand
  
end#stand


def bust

end#bust


# # shuffle the deck
# deck.shuffle!

# # deal the first 2 cards
# card = deck.pop
# puts "Your first card is #{card}"

# # evaluate the first card
# user_score = [40]

# case 
# when card.include?("J")
#   user_score << 10
# when card.include?("Q")
#   user_score << 10
# when card.include?("K")
#   user_score << 10
# when card.include?("A ")
#   puts "Please select:"
#   puts "1) Low (+1)"
#   puts "2) High (+11)"
#   ace_choice = gets.chomp
#     if ace_choice == "1"
#       user_score << 1
#     else
#       user_score << 11
#     end#if
# end#whencase

# # calcualte score value & display it
# user_score = user_score.inject(:+)
# puts "Your card is #{card} and your current score is #{user_score}."

# # ask user to hit or stand
# puts "Please select an action:"
# puts "1) Hit (draw another card)"
# puts "2) Stand (keep your current score)"
# action_choice = gets.chomp
# if action_choice == "1"
#   card = deck.pop
#   puts "You've been dealt the #{card}."





  
# end

# deal the second card


# evaluate the second card


# add the second card to the first card & report the total


# evaluate the total 
