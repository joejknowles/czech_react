class CreateEnglishSentences < ActiveRecord::Migration
  def change
    create_table :english_sentences do |t|

      t.timestamps null: false
    end
  end
end
