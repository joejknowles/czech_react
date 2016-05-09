class Api::LessonsController < ApplicationController
  def index
    if params[:requestingNextLesson]
      sentences = LearningTowerHelper.next_lesson(params[:lessonName])
    else
      sentences = LearningTowerHelper.new_lesson(params[:lessonName])
    end
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