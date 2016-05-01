require 'rails_helper'
require 'test_helpers/learning_tower_test_helper'
require 'test_helpers/answer_helper'
feature 'Course flow' do
include AnswerHelper
include LearningTowerTestHelper

  context 'words have been added' do
    before do
      create_time_lessons
      visit '/learning_tower/days'
    end

    scenario 'when all days answered correctly', js: true do
      answer_all_days
      expect(page).to have_content 'January'
    end

    scenario 'when all time sentences answered correctly', js: true do
      create_verbs_lesson
      answer_all
      expect(page).to have_content 'I am'
    end
  end
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

def answer_all
  answer_all_days
  months.each do |month|
    answer_with month
  end
end

def months
  %w(Prosinec Listopad Říjen Září Srpen Červenec Červen Květen Duben Březen Únor Leden).reverse # YES, THIS IS STUPID
end