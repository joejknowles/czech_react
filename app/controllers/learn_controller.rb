class LearnController < ApplicationController
  def index
    @sentences = LearnHelper.get_lesson
    @sentence = @sentences.pop
  end
end
