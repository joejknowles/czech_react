class CreateCzechWords < ActiveRecord::Migration
  def change
    create_table :czech_words do |t|
      t.string :spelling

      t.timestamps null: false
    end
  end
end
