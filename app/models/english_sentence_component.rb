class EnglishSentenceComponent < ActiveRecord::Base
  belongs_to :english_sentence
  belongs_to :english_word
end
