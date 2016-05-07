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
    lesson_name = sentences[0] ? sentences.first.lesson.name : ''
    respond_to do |format|
      format.json {
        render json: {sentences: sentences, lessonName: lesson_name}.to_json
        }
    end
  end
end