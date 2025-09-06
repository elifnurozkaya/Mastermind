class Game
  attr_accessor :user_code  , :left_attempts , :finish

  def initialize
    @hidden_code = []
    @user_code = []
    @white_pin = 0
    @black_pin = 0
    @left_attempts = 10
    @finish = 0;
  end

  def new_code
    @hidden_code = %w(yellow yellow yellow yellow red red red red pink pink pink pink purple purple purple purple blue blue blue blue green green green green).shuffle[0,4];
  end

  def compare_guess
    self.reset_pins
    4.times do |i|
      4.times do |j|
        if @user_code[j] == @hidden_code[i]
          if i == j
            @black_pin += 1 
          else
            @white_pin += 1
            break
          end
          
        end
      end
    end
  end

  def reset_pins
    @white_pin = 0
    @black_pin = 0
  end

  def take_feedback
    puts "#{@black_pin} black pins"
    puts "#{@white_pin} white pins"
    puts ""
  end

  def did_you_win
    if @black_pin == 4
      return true
    else
      return false 
    end
  end

  def take_guess
    
    puts "Choose four colors"
    4.times do |i|
      print "#{i+1}-"
      @user_code[i] = gets.chomp.downcase 
    end
    puts ""
    
  end

  def show_left_attempts
    puts "#{@left_attempts} attemps left"
  end

  def revial_code
    puts "Hidden code was: #{@hidden_code}"
  end

  def check_guess
    if @left_attempts != 0
      self.compare_guess
      self.take_feedback
      if(self.did_you_win)
        puts "You won!"
        @finish = 1
      else
        @left_attempts -= 1
      end
    else
      puts "You lost!"
      self.revial_code
      @finish = -1;
    end
    

  end

end