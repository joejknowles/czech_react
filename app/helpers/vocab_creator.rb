module VocabCreator
  def self.create *pairs
    pairs.each do |pair|
      LearnHelper.create_question(
        english_sentence: pair[0], czech_sentence: pair[1])
    end
  end
end