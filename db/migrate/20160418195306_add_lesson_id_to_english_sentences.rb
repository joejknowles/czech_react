class AddLessonIdToEnglishSentences < ActiveRecord::Migration
  def change
    add_reference :english_sentences, :lesson, index: true, foreign_key: true
  end
end
