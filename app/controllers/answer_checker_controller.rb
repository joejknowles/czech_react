
class AnswerCheckerController < ApplicationController
  def check
    require_relative '../src/answer_checking/response' unless defined? Response
    respond_to do |format|
      response = AnswerCheckerHelper.create_response params
      format.json { render json: response.to_json }
    end
  end
end
