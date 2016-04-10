class EnglishSentence < ActiveRecord::Base
  has_many :english_sentence_components
  has_many :czech_translations
  def self.create_sentence sentence_data
    sentence = create
    components = []
    sentence_data[:words].each_with_index do |word, word_index|
      components << EnglishSentenceComponent.create(
        english_sentence: sentence,
        word_position: word_index + 1,
        english_word: EnglishWord.where(spelling: word).first_or_create)
    end
    sentence
  end
  def get_as_string
    english_sentence_components.sort_by(&:word_position)
      .map(&:english_word)
      .map(&:spelling)
      .join(' ')
  end
end
