module LearnHelper
  def self.get_sentence
    sentence = EnglishSentence.order("RANDOM()").first
  end
  def self.create_question question_data
    english = EnglishSentence.create_sentence(
      words: question_data[:english_sentence].split(' ')
    )
    CzechTranslation.add_translation(
      english_sentence: english,
      words: question_data[:czech_sentence].split(' '))
  end
end
