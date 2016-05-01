class Api::LessonsController < ApplicationController
  def index
    sentences = LearningTowerHelper.new_lesson(params[:name])
    respond_to do |format|
      format.json { render json: sentences.to_json }
    end
  end
end