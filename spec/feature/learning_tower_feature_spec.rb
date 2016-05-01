require 'rails_helper'
require 'test_helpers/learning_tower_test_helper'
require 'test_helpers/answer_helper'
feature 'Learning Tower' do
include AnswerHelper
include LearningTowerTestHelper

  context 'no words have been added' do
    scenario "should tell you there aren't any words", js: true do
      visit '/learning_tower'
      expect(find('#container')).to have_content 'There are no words.'
    end
  end

  context 'words have been added' do
    before do
      create_months_lesson
      visit '/learning_tower'
    end

    scenario 'should display list of english words', js: true do
      english_months.each do |month|
        expect(page).to have_content month
      end
    end

    scenario 'when answered correctly', js: true do
      fill_in 'answer', with: 'Leden'
      click_button 'Check'
      expect_first_correct_answer_response
    end

    scenario 'when answered correctly multiple times', js: true do
      answer_two
      expect_first_correct_answer_response
      expect_second_correct_answer_response
    end

    xit 'when answered incorrectly multiple times', js: true do
      2.times { answer_incorrectly }
      pending 'haven\'t decided how to handle this yet'
    end

    xit 'when answered incorrectly multiple times after correct answers',
             js: true do
      answer_two
      2.times { answer_incorrectly }
      pending 'haven\'t decided how to handle this yet'
    end
  end
end

def answer_incorrectly
  fill_in 'answer', with: "I don't know, man!"
  click_button 'Check'
end

def english_months
  %w(January February March April May June July August September October November December)
end

def answer_two
  answer_with 'Leden'
  answer_with 'únor'
end