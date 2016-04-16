class CheckAnswerResult
  attr_reader :correct, :user_message
  def initialize correct, user_message = 'nice!'
    @correct, @user_message = correct, user_message
  end

  def self.new_correct
    new true
  end
end