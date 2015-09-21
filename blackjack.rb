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
@dealer_visible_hand = []
@dealer_visible_score = []
@dealer_hidden_hand = []
@dealer_hidden_score = []
@player_hand = []
@player_score = []

# methods to create a deck with names and values

def create_deck
  (2..10).each do |num| 
    @deck_numbers << num
  end

  @deck_suits.each do |suit|
    @deck_numbers.each do |num|
      if num == "A"
        @deck << {name: "#{num} #{suit.capitalize}", value: 11 }
      elsif num == "J" || num == "Q" || num == "K"
        @deck << {name: "#{num} #{suit.capitalize}", value: 10 }
      else 
        @deck << {name: "#{num} of #{suit.capitalize}", value: num }
      end#if
    end#each
  end#each
end#create_deck



# methods for play actions
def dealer_hit
  card = @deck.pop
  @dealer_hidden_hand << card
  @dealer_visible_hand << card
  puts card[:name]
end#dealer_hit


def player_hit
  card = @deck.pop
  @player_hand << card
  puts card[:name]
end#player_hit


def create_player_total
  @player_hand.each do |x|
    @player_score << x[:value]
  end#each
  @player_score = @player_score.inject(:+)
end#create_total

def create_dealer_total
  @dealer_hidden_hand.each do |x|
    @dealer_hidden_score << x[:value]
  end#each
  @dealer_hidden_score = @dealer_hidden_score.inject(:+)
end#create_total


def stand
  
end#stand


def bust

end#bust

def score_evaluation
  create_dealer_total
  if @player_score.to_i < 21
    puts "Dealer has #{@dealer_hidden_score}. You may Hit or Stand. "
  elsif @player_score.to_i == 21
    puts "You win."
  else
    puts "I'm sorry, you busted."
  end#if
end#score_evaluation


def play_game
  create_deck

  @deck.shuffle!

  puts "Dealer's Hand:"
  dealer_hit
  dealer_hit
  #puts "and one card you can't see"
  puts
  puts "Your Hand:"
  player_hit
  player_hit
  puts
  create_player_total
  puts "Your total is #{@player_score}."
  score_evaluation
  puts

end#play_game

play_game



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
