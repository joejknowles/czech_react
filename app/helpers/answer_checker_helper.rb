require './app/src/answer_checking/response'
module AnswerCheckerHelper
  def self.create_response params
    Response.new(clean_params params)
  end

  def self.clean_params params
    params.permit(:answer, :sentence_id, :attempt)
  end
end
