class VocabCreator
  def create lesson_name, *questions
    @lesson = Lesson.find_or_create_by(name: lesson_name)
    @questions = questions
    create_questions
  end

  private

  def create_questions
    @questions.each do |question|
      create_question(
        english_sentence: question[0],
        czech_sentences: question[1])
    end
  end

  def create_question question_data
    english = EnglishSentence.find_or_create_by(lesson: @lesson,
      display: question_data[:english_sentence]
    )
    question_data[:czech_sentences].each do |czech|
      create_czech_translation english, czech
    end
  end

  def create_czech_translation english, czech
    CzechTranslation.find_or_create_by(
      english_sentence: english,
      display: czech)
  end
end