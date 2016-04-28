require './db/seeding/src/seed_adaptors/time_sentences'
module LearningTowerTestHelper
  def self.create_months_lesson
    Seeds::TimeSentences.add_months
  end
end