require 'rails_helper'
require 'test_helpers/learn_test_helper'

feature 'practice' do
  context 'no words have been added' do
    scenario "should tell you there aren't any words" do
      visit '/learn'
      expect(page).to have_content 'There are no words.'
    end
  end
  context 'words have been added' do
    before do
      LearnTestHelper.create_first_lesson
      visit '/learn'
    end
    scenario 'should ask you to translate' do
      expect(page).to have_content 'Translate to Czech:'
      expect(page).to have_content 'I am'
    end
    context 'when answered correctly', js: true do
      scenario 'should congratulate' do
        fill_in 'answer', with: 'jsem'
        click_button 'Check'
        expect(page).to have_content 'nice!'
      end
    end
    context 'when answered incorrectly', js: true do
      scenario 'should commiserate' do
        answer_incorrectly
        expect(page).to have_content 'Not quite!'
      end
    end
    context 'when answered incorrectly 3 times', js: true do
      scenario 'should commiserate' do
        2.times { answer_incorrectly }
        expect(page).to have_content 'Try "jsem"'
      end
    end
  end
end

def answer_incorrectly
  fill_in 'answer', with: "I don't know, man!"
  click_button 'Check'
end