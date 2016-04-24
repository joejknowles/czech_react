require './app/src/lesson_input/vocab_creator'
class LearnTestHelper
  def self.create_first_lesson
    VocabCreator.new.create 'verbs', ['I am', ['Jsem']]
  end
end