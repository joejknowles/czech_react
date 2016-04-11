module AnswerCheckerHelper
  def self.check_answer params
    sentence_id = params[:sentence_id]
    answer = params[:answer].downcase
    correct = CzechTranslation.where(
      english_sentence: sentence_id).map{ |czech| czech.get_as_string.downcase}
    puts answer, correct
    correct.include? answer
  end
end
