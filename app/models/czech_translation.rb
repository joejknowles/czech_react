class CzechTranslation < ActiveRecord::Base
  belongs_to :english_sentence
  has_many :czech_translation_components
  def self.add_translation translation_data
    translation = create(
      english_sentence: translation_data[:english_sentence])
    components = []
    translation_data[:words].each_with_index do |word, word_index|
      components << CzechTranslationComponent.create(
        czech_translation: translation,
        word_position: word_index + 1,
        czech_word: CzechWord.where(spelling: word).first_or_create)
    end
    translation
  end
  def get_as_string
    czech_translation_components.sort_by(&:word_position)
      .map(&:czech_word)
      .map(&:spelling)
      .join(' ')
  end
end
