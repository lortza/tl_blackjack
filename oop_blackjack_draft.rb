# this version is my own version from scratch


# assignment: https://www.gotealeaf.com/lessons/f4d7b093/assignments/1653
# create the deck
# define game play
  # shuffle the deck
  # player draws
  # ask player Stand or Hit
  # perform Stand or Hit
  # sum the cards


class Player
end #Player

class User < Player 
end #User

class Dealer < Player
end #Dealer

class Card
  attr_accessor :card

  def initialize(hash)
    @card = hash
    # @name = n 
    # @value = v
  end #initialize

end #Card


class Deck
  SUITS = ["Clubs", "Diamonds", "Hearts", "Spades"]

  def initialize
    @cards = []
    @card_numbers = ["J", "Q", "K", "A"]

    (2..10).each do |num| 
      @card_numbers << num
    end #each

    SUITS.each do |suit|
      @card_numbers.each do |num|
        if num == "A"
          @cards << Cards.new({name: "#{num} of #{suit.capitalize}", value: 11 })
        elsif num == "J" || num == "Q" || num == "K" # OR elsif num.to_i == 0
          @cards << Cards.new({name: "#{num} of #{suit.capitalize}", value: 10 })
        else 
          @cards << Card.new({name: "#{num} of #{suit.capitalize}", value: num })
        end#if
      end#each num
    end#each suit
  end #initialize
end #Deck

class Hand
  def initial_2_cards
  end #initial_2_cards

  def calculate_hand_total(hand, current_current_score)
    catcher = []
    hand.each do |x|
      catcher << x[:value]
    end#each
    current_score = catcher.inject(:+)
    #puts "calculate_hand_total: #{current_score}"
    current_score
  end #calculate_hand_total

end #Hand

class Game
  def initialize
    @deck = Deck.new 
    @user = User.new
    @dealer = Dealer.new
  end #initialize

  def play
    # deal 2 cards to the User and the Dealer
    # give totals for both players cards
      # if there is an ace, and the Player's current total is > 21, A = 1
    # ask User to hit or stand
      # if hit, add 1 card and ask again until User says Stand or score >= 21
      # if stand, it is Dealer's turn
    # Dealer hits while score < 17 (17+ dealer must stand)
  end #play

  def play_again_query
    puts "Play again? Y | N?"
    @input = gets.chomp.upcase 
    if @input == "Y"
      play_game
    elsif @input == "N"
      puts "Okay Bye."
    else
      while @input != "N" && @input != "Y"
        puts "I'm sorry, that's not an option."
        play_again_query
      end #while
    end #if
  end #play_again_query

end #Game



##################################################
# # --Nouns
# # hand
# # card
# # score

# # --Verbs
# # shuffle
# # hit
# # stand
# # compare scores




# # arrays needed for totals and play actions
# want_to_play = "Y"
# @dealer_visible_hand = []
# @dealer_visible_score = []
# @dealer_hidden_hand = []
# @dealer_hidden_score = []
# @player_hand = []
# @player_score = []

# # methods to create a deck with names and values



# # methods for play actions
# def dealer_hit
#   card = @deck.pop
#   @dealer_hidden_hand << card
#   @dealer_visible_hand << card
#   puts card[:name]
# end#dealer_hit


# def player_hit
#   card = @deck.pop
#   @player_hand << card
#   puts card[:name]
# end#player_hit




# def stand
  
# end#stand


# def bust

# end#bust

# def request_action
#   puts "Please choose:"
#   puts " 1) Hit"
#   puts " 2) Stand"
#   input = gets.chomp
#   if input == "1"
#     player_hit
#   else
#     puts "STAND"
#   end#if
# end#request_action

# def score_evaluation
#   puts
#   if @player_score.to_i < 21
#     puts "Dealer has #{@dealer_hidden_score}. You may Hit or Stand. "
#     request_action
#   elsif @player_score.to_i == 21
#     puts "You win."
#   else
#     puts "I'm sorry, you busted."
#   end#if
# end#score_evaluation



# def play_game
#   create_deck

#   @deck.shuffle!

#   puts "Dealer's Hand:"
#   dealer_hit
#   dealer_hit
#   #puts "and one card you can't see"
#   @dealer_hidden_score = calculate_score(@dealer_hidden_hand, @dealer_hidden_score)
#   puts "The Dealer's cards total #{@dealer_hidden_score}."
#   puts
#   puts "Your Hand:"
#   player_hit
#   player_hit
#   @player_score = calculate_score(@player_hand, @player_score)

#   while @player_score < 21 do 
#     puts "Your cards total #{@player_score}."
#     score_evaluation
#     @player_score = calculate_score(@player_hand, @player_score)
#   end#while

  

    
# end#play_game

# play_game

d = Deck.new
p d
puts "=============="
p @card

