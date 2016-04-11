module LearnHelper
  def self.get_sentence
    sentence = EnglishSentence.order("RANDOM()").first
  end
  def self.create_question question_data
    english = EnglishSentence.create_sentence(
      words: question_data[:english_sentence].split(' ')
    )
    if czech_sentences = question_data[:czech_sentences]
      czech_sentences.each do |czech|
        create_czech english, czech
      end
    else
      create_czech english, question_data[:czech_sentence]
    end
  end

  def self.create_czech english, czech
    CzechTranslation.add_translation(
      english_sentence: english,
      words: czech.split(' '))
  end
end
