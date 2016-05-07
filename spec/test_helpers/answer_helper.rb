module AnswerHelper
  def answer_with answer
    fill_in 'answer', with: answer
    click_button 'Check'
  end

  def answer_all_days
    answer_with 'pondeli'
    answer_with 'utery'
    answer_with 'streda'
    answer_with 'ctvrtek'
    answer_with 'patek'
    answer_with 'sobota'
    answer_with 'nedele'
  end

  def answer_all_months
    months.each do |month|
      answer_with month
    end
  end

  def answer_all_time
    answer_all_days
    answer_all_months
  end

  def months
    %w(Prosinec Listopad Říjen Září Srpen Červenec Červen Květen Duben Březen Únor Leden).reverse # YES, THIS IS STUPID
  end


  def answer_incorrectly
    fill_in 'answer', with: "I don't know, man!"
    click_button 'Check'
  end
end