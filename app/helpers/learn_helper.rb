module LearnHelper
  def self.get_lesson
    Array(EnglishSentence.limit(100)).shuffle
  end
end
