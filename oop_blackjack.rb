# this version is based on the code from the class solution. i am using it to create the gameplay engine.
# assignment: https://www.gotealeaf.com/lessons/f4d7b093/assignments/1653

require 'rubygems'
require 'pry'

# Object Oriented Blackjack game

# 1) Abstraction
# 2) Encapsulation

class Card
  attr_accessor :suit, :face_value

  def initialize(s, fv)
    @suit = s
    @face_value = fv
  end

  def pretty_output
    "The #{face_value} of #{find_suit}"
  end

  def to_s
    pretty_output
  end

  def find_suit
    ret_val = case suit
                when 'H' then 'Hearts'
                when 'D' then 'Diamonds'
                when 'S' then 'Spades'
                when 'C' then 'Clubs'
              end
    ret_val
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    ['H', 'D', 'S', 'C'].each do |suit|
      ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].each do |face_value|
        @cards << Card.new(suit, face_value)
      end
    end
    scramble!
  end

  def scramble!
    cards.shuffle!
  end

  def deal_one
    cards.pop
  end

  def size
    cards.size
  end
end

module Hand
  def show_hand
    puts "---- #{name}'s Hand ----"
    cards.each do|card|
      puts "=> #{card}"
    end
    puts "=> Total: #{total}"
  end

  def total
    face_values = cards.map{|card| card.face_value }

    total = 0
    face_values.each do |val|
      if val == "A"
        total += 11
      else
        total += (val.to_i == 0 ? 10 : val.to_i)
      end #if
    end #each

    #correct for Aces
    face_values.select{|val| val == "A"}.count.times do
      break if total <= 21
      total -= 10
    end #break if

    total
  end #total

  def add_card(new_card)
    cards << new_card
  end

  def is_busted?
    total > 21
  end
end

class Player
  include Hand

  attr_accessor :name, :cards

  def initialize(n)
    @name = n
    @cards = []
  end

end

class Dealer
  include Hand

  attr_accessor :name, :cards

  def initialize
    @name = "Dealer"
    @cards = []
  end #initialize

  def show_hand
    puts "---- Dealer's Hand ----"
    puts "(The first card is hidden)"
    puts "The second card is #{cards[1]}"
  end #show_hand
end #Dealer


class Game
  attr_accessor :deck, :player, :dealer
  def initialize
    @deck = Deck.new
    @player = Player.new("You")
    @dealer = Dealer.new 
  end #initialize

  def set_player_name
    puts "Please enter your name:" 
    player.name = gets.chomp
  end #set_player_name

  def deal_cards
    player.add_card(deck.deal_one) 
    dealer.add_card(deck.deal_one) 
    player.add_card(deck.deal_one) 
    dealer.add_card(deck.deal_one)
  end #deal_cards

  def show_exposed_cards
    player.show_hand
    dealer.show_hand 
  end #show_exposed_cards
    
    
    

  def play_game
    puts "Welcome to Blackjack"
    puts "You and the Dealer will each be dealt 2 cards."

    set_player_name
    deal_cards
    show_exposed_cards
    # player_turn
    # dealer_turn
    # who_won?(player, dealer)



     #play_again_query
  end #play_game
end #Game

def play_again_query
  puts "Play again? Y | N"
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

game = Game.new
game.play_game


