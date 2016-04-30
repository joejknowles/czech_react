require_relative 'answer_checker'
require_relative 'message_creator'

class Response
  include AnswerChecker, MessageCreator
  attr_reader :correct, :user_message, :suggestion
  def initialize info
    extract_info info
    check_answer
    create_message
  end

  private

  def extract_info info
    p @answer = info[:answer].downcase
    p @sentence = info[:sentence_id]
    p @attempt = info[:attempt].to_i

  end
end