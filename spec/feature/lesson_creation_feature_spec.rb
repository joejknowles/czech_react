require 'test_helpers/question_helper'
include QuestionHelper
feature 'separate lessons in learning tower' do
  context 'words have been added to months lesson and separately' do
    before do
      create_months_lesson
      visit '/learning_tower/months'
    end

    scenario 'should have months', js: true do
      english_months.each do |month|
      expect(page).to have_content month
      end
    end

    scenario 'should not have "I am"', js: true do
      expect(page).not_to have_content 'I am'
    end
  end
end

def english_months
  %w(January February March April May June July August September October November December)
end