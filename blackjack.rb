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
want_to_play = "Y"
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
      elsif num == "J" || num == "Q" || num == "K" # OR elsif num.to_i == 0
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


def calculate_score(hand, score)
  catcher = []
  hand.each do |x|
    catcher << x[:value]
  end#each
  score = catcher.inject(:+)
  #puts "calculate_score's score: #{score}"
  score
end#calculate_score

def stand
  
end#stand


def bust

end#bust

def request_action
  puts "Please choose:"
  puts " 1) Hit"
  puts " 2) Stand"
  input = gets.chomp
  if input == "1"
    player_hit
  else
    puts "STAND"
  end#if
end#request_action

def score_evaluation
  puts
  if @player_score.to_i < 21
    puts "Dealer has #{@dealer_hidden_score}. You may Hit or Stand. "
    request_action
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
  @dealer_hidden_score = calculate_score(@dealer_hidden_hand, @dealer_hidden_score)
  puts "The Dealer's cards total #{@dealer_hidden_score}."
  puts
  puts "Your Hand:"
  player_hit
  player_hit
  @player_score = calculate_score(@player_hand, @player_score)

  while @player_score < 21 do 
    puts "Your cards total #{@player_score}."
    score_evaluation
    @player_score = calculate_score(@player_hand, @player_score)
  end#while

  

    
end#play_game

play_game



# puts "Would you like to play again?  Y | N"
# want_to_play = gets.chomp
# if want_to_play.upcase.include? "Y"
#   play_game
# else
#   puts "okay bye"
# end#if




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


