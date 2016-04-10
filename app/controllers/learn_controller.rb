class LearnController < ApplicationController
  def index
    @sentence = LearnHelper.get_sentence
  end
end
