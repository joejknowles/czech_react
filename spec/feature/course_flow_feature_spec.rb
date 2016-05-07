require 'rails_helper'
require 'test_helpers/learning_tower_test_helper'
require 'test_helpers/answer_helper'
require 'test_helpers/question_helper'
feature 'Course flow' do
include AnswerHelper
include LearningTowerTestHelper
include QuestionHelper

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
      answer_all_time
      expect(page).to have_content 'I am'
    end
  end
end