require './db/seeding/src/seed_adaptors/verbs'
class LearnTestHelper
  def self.create_first_lesson
    Seeds::Verbs.add_first_verb
  end
end