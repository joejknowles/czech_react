require_relative 'answer_checker'
require_relative 'message_creator'

class Response
  include AnswerChecker, MessageCreator
  attr_reader :correct, :suggestion, :english_sentence_id
  def initialize info
    extract_info info
    check_answer
    create_message
  end

  private

  def extract_info info
    @answer = info[:answer].downcase
    @english_sentence_id = info[:sentence_id]
    @attempt = info[:attempt].to_i
  end
end