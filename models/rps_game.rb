class RPSGame
  LEGAL_MOVES = [:rock, :paper, :scissors]

  WINNING_PLAY = [{ user: :paper,   computer: :rock     },
                  { user: :rock,    computer: :scissors },
                  { user: :scissor, computer: :paper    }]

  def self.valid_play?(user_play)
    LEGAL_MOVES.include? user_play
  end

  attr_accessor :user_play, :computer_play

  def initialize(user_play)
    @user_play = user_play
    @computer_play = LEGAL_MOVES.sample

    fail PlayTypeError unless self.class.valid_play? user_play
  end

  def won?
    result = {
      user: user_play,
      computer: computer_play
    }

    WINNING_PLAY.include? result
  end

  def tied?
    user_play == computer_play
  end

  def lost?
    !won? && !tied?
  end

  def result
    case
    when won?
      'won'
    when tied?
      'tied'
    else
      'lost'
    end
  end
end
