require_relative '../entities/check_answer_result'
module AnswerCheckerHelper
  def self.check_answer params
    sentence_id = params[:sentence_id]
    answer = params[:answer].downcase
    correct_options = Array(CzechTranslation.where(
      english_sentence: sentence_id))
      p "here", correct_options
      p correct_options[0]
    correct_options.map!{ |czech| czech.get_as_string.downcase}
    puts answer, correct_options
    correct = correct_options.include? answer
    if correct
      result = CheckAnswerResult.new_correct
    else
      p correct_options
      p correct_options[0]
      message = 'Not quite!'
      message << " Try \"#{correct_options.first}\"" if params[:attempt].to_i > 1
      result = CheckAnswerResult.new(
        false,
        message)
    end
    result
  end
end
