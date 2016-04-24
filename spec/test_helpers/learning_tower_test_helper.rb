require './db/seed_files/time_sentences'
module LearningTowerTestHelper
  def self.create_months_lesson
    Seeds::TimeSentences.add_months
  end
end