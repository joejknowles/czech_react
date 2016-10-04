require './app/src/lesson_input/vocab_creator'
class AddController < ApplicationController
  def index
  end

  def add
    # p params[:pairs]
    # reak.break.break
    # render :index

    if params[:pairs] && params[:pairs].any?
      VocabCreator.new.create_for_hash('test_lesson', params[:pairs])
    end
    redirect_to '/'
  end
end
