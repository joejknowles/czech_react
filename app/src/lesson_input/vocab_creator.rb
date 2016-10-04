class VocabCreator
  def create lesson_name, *questions
    @lesson = Lesson.find_or_create_by(name: lesson_name)
    @questions = questions
    create_questions
  end

  def create_for_hash lesson_name, questions
    @lesson = Lesson.find_or_create_by(name: lesson_name)
    @questions = questions
    create_questions_for_hash
  end

  private

  def create_questions
    @questions.each do |question|
      create_question(
        english_sentence: question[0],
        czech_sentences: question[1])
    end
  end

  def create_questions_for_hash
    puts '1', @questions
    @questions.each do |question|
      p '2',question
      create_question(question)
    end
  end

  def create_question question_data
    puts '3', question_data
    english = EnglishSentence.find_or_create_by(lesson: @lesson,
      display: question_data[:english_sentence]
    )
    question_data[:czech_sentences].each do |czech|
      puts '5', create_czech_translation(english, czech)
    end
    puts '4', english
  end

  def create_czech_translation english, czech
    CzechTranslation.find_or_create_by(
      english_sentence: english,
      display: czech)
  end
end