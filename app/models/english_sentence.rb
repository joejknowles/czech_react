class EnglishSentence < ActiveRecord::Base
  has_many :english_sentence_components
  has_many :czech_translations
  attr_reader :display
  after_initialize { |sentence| sentence.create_display }
  def self.create_sentence sentence_data
    sentence = new
    components = []
    sentence_data[:words].each_with_index do |word, word_index|
      components << EnglishSentenceComponent.create(
        english_sentence: sentence,
        word_position: word_index + 1,
        english_word: EnglishWord.where(spelling: word).first_or_create)
    end
    sentence
  end

  def create_display
    @display = english_sentence_components.sort_by(&:word_position)
      .map(&:english_word)
      .map(&:spelling)
      .join(' ')
  end

  def as_json options={}
  {
    display: @display,
    id: id
  }
end
end
