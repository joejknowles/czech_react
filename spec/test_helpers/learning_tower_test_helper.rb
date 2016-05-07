require './db/seeding/src/seed_adaptors/time_sentences'
require './db/seeding/src/seed_adaptors/verbs'
module LearningTowerTestHelper
  def expect_first_correct_answer_response
    expect_answered_question_to_move 'January'
    expect_correct_answer_to_move 'Leden'
  end

  def expect_second_correct_answer_response
    expect_answered_question_to_move 'February'
    expect_correct_answer_to_move 'Únor'
  end

  def expect_answered_question_to_move question
    expect(find('#high-tower')).to have_content question
  end

  def expect_correct_answer_to_move answer
    expect(find('#answer-tower')).to have_content answer
  end

  def expect_incorrect_answer_response
    expect_answered_question_not_to_move 'January'
    expect_correct_answer_not_to_move 'Leden'
  end

  def expect_incorrect_answer_response_after_two_correct
    expect_answered_question_not_to_move 'March'
    expect_correct_answer_not_to_move 'Brežen'
  end

  def expect_answered_question_not_to_move question
    expect(find('#high-tower')).not_to have_content question
  end

  def expect_correct_answer_not_to_move answer
    expect(find('#answer-tower')).not_to have_content answer
  end
end