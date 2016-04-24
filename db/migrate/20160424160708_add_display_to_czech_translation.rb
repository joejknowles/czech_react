class AddDisplayToCzechTranslation < ActiveRecord::Migration
  def change
    add_column :czech_translations, :display, :string
  end
end
