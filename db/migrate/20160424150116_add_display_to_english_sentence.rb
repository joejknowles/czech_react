class AddDisplayToEnglishSentence < ActiveRecord::Migration
  def change
    add_column :english_sentences, :display, :string
  end
end
