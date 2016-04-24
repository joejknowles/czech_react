class VocabCreator
  def create lesson_name, *questions
    lesson = Lesson.find_or_create_by(name: lesson_name)
    questions.each do |question|
      create_question(
        lesson: lesson,
        english_sentence: question[0],
        czech_sentences: question[1])
    end
  end

  def create_question question_data
    lesson = question_data[:lesson]
    english = EnglishSentence.create_sentence(lesson: lesson,
      words: question_data[:english_sentence].split(' ')
    )
    if (czech_sentence = question_data[:czech_sentences]).kind_of? Array
      czech_sentence.each do |czech|
        create_czech english, czech
      end
    else
      create_czech english, question_data[:czech_sentences]
    end
  end

  def create_czech english, czech
    CzechTranslation.add_translation(
      english_sentence: english,
      words: czech.split(' '))
  end
end