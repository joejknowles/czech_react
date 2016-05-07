module QuestionHelper
  def create_months_lesson
    Seeds::TimeSentences.add_months
  end

  def create_time_lessons
    Seeds::TimeSentences.add_all
  end

  def create_verbs_lesson
    Seeds::Verbs.add_all
  end
end