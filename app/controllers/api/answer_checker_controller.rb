class Api::AnswerCheckerController < ApplicationController
  def check
    respond_to do |format|
      response = AnswerCheckerHelper.create_response params
      format.json { render json: response.to_json }
    end
  end
end
