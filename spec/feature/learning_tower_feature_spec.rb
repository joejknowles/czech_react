require 'rails_helper'
require 'test_helpers/learning_tower_test_helper'
require 'test_helpers/answer_helper'
feature 'Learning Tower' do
include AnswerHelper

  context 'no words have been added' do
    scenario "should tell you there aren't any words" do
      visit '/learning_tower'
      expect(page).to have_content 'There are no words.'
    end
  end

  context 'words have been added' do
    before do
      LearningTowerTestHelper.create_months_lesson
      visit '/learning_tower'
    end

    scenario 'should display list of english words' do
      expect(find('#question').text).to eq('January')
      english_months.each do |month|
        expect(page).to have_content month
      end
    end

    scenario 'when answered correctly', js: true do
      fill_in 'answer', with: 'Leden'
      click_button 'Check'
      expect(page).to have_content 'nice!'
      expect(page).to have_content 'January Leden'
      expect(find('#question').text).to eq('February')
    end

    scenario 'when answered correctly multiple times', js: true do
      answer_two
      expect(page).to have_content 'nice!'
      expect(page).to have_content 'January Leden'
      expect(page).to have_content 'Únor'
      expect(find('#question').text).to eq('March')
    end

    scenario 'when answered incorrectly multiple times', js: true do
      2.times { answer_incorrectly }
      expect(page).to have_content ' "Leden"'
      expect(page).to have_content 'Start again!'
    end

    scenario 'when answered incorrectly multiple times after correct answers',
             js: true do
      answer_two
      2.times { answer_incorrectly }
      expect(find('#question')).to have_content('January')
    end
  end
end

def answer_incorrectly
  fill_in 'answer', with: "I don't know, man!"
  click_button 'Check'
  expect(page).to have_content 'Not quite!'
end

def english_months
  %w(January February March April May June July August September October November December)
end

def answer_two
  answer_with 'Leden'
  answer_with 'únor'
end