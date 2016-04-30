class LearnController < ApplicationController
  def index
    @sentences = LearnHelper.get_lesson
    @first_sentence = @sentences.pop
  end
end
