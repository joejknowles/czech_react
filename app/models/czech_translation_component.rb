class CzechTranslationComponent < ActiveRecord::Base
  belongs_to :czech_translation
  belongs_to :czech_word
end
