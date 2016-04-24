require_relative '../src/answer_checking/response'
class AnswerCheckerController < ApplicationController
  def check
    require_relative '../helpers/answer_checking/response' unless defined? Response
    respond_to do |format|
      response = Response.new clean_params
      format.json { render json: response.to_json }
    end
  end

  def clean_params
    params.permit(:answer, :sentence_id, :attempt)
  end
end
