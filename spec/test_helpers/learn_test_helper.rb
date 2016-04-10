class LearnTestHelper
  def self.create_first_lesson
    LearnHelper.create_question english_sentence: 'I am', czech_sentence: 'Jsem'
  end
end