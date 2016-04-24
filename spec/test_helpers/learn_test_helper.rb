require './app/src/lesson_input/vocab_creator'
class LearnTestHelper
  def self.create_first_lesson
    VocabCreator.new.create_question lesson_name: 'verbs',english_sentence: 'I am', czech_sentences: ['Jsem']
  end
end