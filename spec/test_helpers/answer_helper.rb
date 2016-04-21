module AnswerHelper
  def answer_with answer
    fill_in 'answer', with: answer
    click_button 'Check'
    expect(find('body')).to have_content 'nice'
  end
end