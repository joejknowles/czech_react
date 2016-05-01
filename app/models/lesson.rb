class Lesson < ActiveRecord::Base
  has_many :english_sentences

  def self.next_lesson lesson_name
    current = find_by(name: lesson_name)
    where('id > ?', current.id).first
  end
end
