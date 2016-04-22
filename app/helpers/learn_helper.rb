module LearnHelper
  def self.get_lesson
    Array(EnglishSentence.limit(100)).shuffle
  end
  def self.create_question question_data
    lesson = Lesson.find_or_create_by(name: question_data[:lesson_name])
    english = EnglishSentence.create_sentence(lesson: lesson,
      words: question_data[:english_sentence].split(' ')
    )
    if (czech_sentence = question_data[:czech_sentence]).kind_of? Array
      czech_sentence.each do |czech|
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
