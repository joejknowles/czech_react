class CreateCzechTranslations < ActiveRecord::Migration
  def change
    create_table :czech_translations do |t|
      t.belongs_to :english_sentence, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
