class EnglishSentence < ActiveRecord::Base
  has_many :czech_translations
  belongs_to :lesson
  def self.create_sentence sentence_data
    create(lesson: sentence_data[:lesson], display: sentence_data[:words])
  end

  def as_json options={}
    {
      display: display,
      id: id
    }
  end
end
