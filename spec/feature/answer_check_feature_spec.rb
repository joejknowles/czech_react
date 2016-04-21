require 'rails_helper'
require 'test_helpers/learning_tower_test_helper'
require 'test_helpers/answer_helper'
include AnswerHelper

feature 'Answer cheking' do
  context 'accepts varied casing' do
    before do
      LearningTowerTestHelper.create_months_lesson
      visit '/learning_tower'
    end

    scenario 'with capitalized ascii characters', js: true do
      fill_in 'answer', with: 'LeDeN'
      click_button 'Check'
      expect(page).to have_content 'nice!'
      expect(page).to have_content 'January Leden'
      expect(find('#question').text).to eq('February')
    end

    scenario 'with uncapitalized ascii characters', js: true do
      fill_in 'answer', with: 'leden'
      click_button 'Check'
      expect(page).to have_content 'nice!'
      expect(page).to have_content 'January Leden'
      expect(find('#question').text).to eq('February')
    end

    scenario 'with capitalized non-ascii characters', js: true do
      answer_with 'Leden'
      answer_with 'Únor'
      expect(page).to have_content 'nice!'
      expect(page).to have_content 'January Leden'
      expect(find('#question').text).to eq('March')
    end

    scenario 'with uncapitalized non-ascii characters', js: true do
      answer_with 'Leden'
      answer_with 'únor'
      expect(page).to have_content 'nice!'
      expect(page).to have_content 'February Únor'
      expect(find('#question').text).to eq('March')
    end
  end

  context 'accepts innacurate diacritics' do
    before do
      LearningTowerTestHelper.create_months_lesson
      visit '/learning_tower'
    end

    scenario 'with extra non-ascii accented characters', js: true do
      answer_with 'ľéďéñ'
      expect(page).to have_content 'nice!'
      expect(find('#question').text).to eq('February')
    end

    scenario 'with missing non-ascii accented characters', js: true do
      answer_with 'Leden'
      answer_with 'unor'
      expect(page).to have_content 'nice!'
      expect(page).to have_content 'February Únor'
      expect(find('#question').text).to eq('March')
    end
  end
end
