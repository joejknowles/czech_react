class Api::LessonsController < ApplicationController
  def index
    sentences = LearningTowerHelper.new_lesson(params[:name])
    lesson_response sentences
  end

  def next
    sentences = LearningTowerHelper.next_lesson(params[:name])
    lesson_response sentences
  end

  def lesson_response sentences
    respond_to do |format|
      format.json {
        render json: {sentences: sentences, lessonName: sentences.first.lesson.name}.to_json
        }
    end
  end
end