module AnswerCheckerHelper
  def self.check_answer params
    sentence_id = params[:sentence_id]
    params[:answer].downcase == CzechTranslation.find_by(english_sentence: sentence_id).get_as_string.downcase
  end
end
