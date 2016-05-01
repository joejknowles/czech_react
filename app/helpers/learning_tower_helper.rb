module LearningTowerHelper
  def self.new_lesson lesson_name = nil
    if lesson_name && lesson_name != 'learning_tower'
      lesson = Lesson.find_by name: lesson_name
      return Array(EnglishSentence.where(lesson: lesson))
    else
      return EnglishSentence.limit 100
    end
  end

  def self.next_lesson lesson_name
    lesson = Lesson.next_lesson lesson_name
    Array(EnglishSentence.where(lesson: lesson))
  end
end
