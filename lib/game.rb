class Game
  attr_accessor :user_code 

  def initialize
    @hidden_code = []
    @user_code = []
    @white_pin = 0
    @black_pin = 0
  end

  def new_code
    @hidden_code = %w(yellow red pink purple blue green).shuffle[0,4];
  end

  def compare_guess
    4.times do |i|
      4.times do |j|
        if @user_code[i] == @hidden_code[j]
          if i == j
            @black_pin += 1
          else
            @white_pin += 1
          end
          
        end
      end
    end
  end

  def take_feedback
    puts "#{@black_pin} black pins"
    puts "#{@white_pin} white pins"
  end

  def did_you_win
    if @black_pin == 4
      return true
    else
      return false 
    end
  end

  def take_guess
    4.times do |i|
      print "#{i+1}-"
      @user_code[i] = gets.chomp.downcase 
      puts ""
    end
    
  end

end