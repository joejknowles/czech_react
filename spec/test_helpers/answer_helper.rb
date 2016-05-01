module AnswerHelper
  def answer_with answer
    fill_in 'answer', with: answer
    click_button 'Check'
  end
end