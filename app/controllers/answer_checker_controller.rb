class AnswerCheckerController < ApplicationController
  def check
    respond_to do |format|
      result = AnswerCheckerHelper.check_answer params
      format.json { render json: result.to_json }
    end
  end
end
