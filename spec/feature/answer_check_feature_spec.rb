require 'rails_helper'
require 'test_helpers/learning_tower_test_helper'
require 'test_helpers/answer_helper'
include AnswerHelper
include LearningTowerTestHelper

feature 'Answer checking' do
  context 'accepts varied casing' do
    before do
      LearningTowerTestHelper.create_months_lesson
      visit '/learning_tower'
    end

    scenario 'with capitalized ascii characters', js: true do
      fill_in 'answer', with: 'LeDeN'
      click_button 'Check'
      expect_first_correct_answer_response
    end

    scenario 'with uncapitalized ascii characters', js: true do
      fill_in 'answer', with: 'leden'
      click_button 'Check'
      expect_first_correct_answer_response
    end

    scenario 'with capitalized non-ascii characters', js: true do
      answer_with 'Leden'
      answer_with 'Únor'
      expect_second_correct_answer_response
    end

    scenario 'with uncapitalized non-ascii characters', js: true do
      answer_with 'Leden'
      answer_with 'únor'
      expect_second_correct_answer_response
    end
  end

  context 'accepts innacurate diacritics' do
    before do
      LearningTowerTestHelper.create_months_lesson
      visit '/learning_tower'
    end

    scenario 'with extra non-ascii accented characters', js: true do
      answer_with 'ľéďéñ'
      expect_first_correct_answer_response
    end

    scenario 'with missing non-ascii accented characters', js: true do
      answer_with 'Leden'
      answer_with 'unor'
      expect_second_correct_answer_response
    end
  end

  context 'accepts different punctuation' do
    before do
      LearningTowerTestHelper.create_months_lesson
      visit '/learning_tower'
    end

    scenario 'with extra full stop', js: true do
      answer_with 'ľéďéñ.'
      expect_first_correct_answer_response
    end

    scenario 'with missing full stop', js: true do
      CzechTranslation.find_by(display: 'leden').update(display: 'Leden.')
      answer_with 'Leden'
      expect_first_correct_answer_response
    end
  end
end
