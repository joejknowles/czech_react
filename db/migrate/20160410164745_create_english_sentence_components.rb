class CreateEnglishSentenceComponents < ActiveRecord::Migration
  def change
    create_table :english_sentence_components do |t|
      t.belongs_to :english_sentence, index: true, foreign_key: true
      t.integer :word_position
      t.belongs_to :english_word, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
