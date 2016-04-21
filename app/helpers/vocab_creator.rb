module VocabCreator
  def self.create lesson_name, *pairs
    pairs.each do |pair|
      LearnHelper.create_question(
        lesson_name: lesson_name,
        english_sentence: pair[0],
        czech_sentence: pair[1])
    end
  end
end