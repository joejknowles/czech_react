class LearningTowerController < ApplicationController
  def index
    @sentences = LearningTowerHelper.new_lesson
    @first_sentence = @sentences.first
  end

  def show
    @sentences = LearningTowerHelper.new_lesson(params[:lesson_name])
    @first_sentence = @sentences.first
    render :index
  end
end
