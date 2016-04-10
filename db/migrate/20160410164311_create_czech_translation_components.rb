class CreateCzechTranslationComponents < ActiveRecord::Migration
  def change
    create_table :czech_translation_components do |t|
      t.belongs_to :czech_translation, index: true, foreign_key: true
      t.integer :word_position
      t.belongs_to :czech_word, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end