class AnswerCheckerController < ApplicationController

  def check
    if AnswerCheckerHelper.check_answer params
      flash[:notice] = 'Well done!'
    else
      flash[:notice] = 'Not quite!'
    end
    redirect_to '/learn'
  end
end
