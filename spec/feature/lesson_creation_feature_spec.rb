feature 'separate lessons in learning tower' do
  context 'words have been added to months lesson and separately' do
    before do
      LearnTestHelper.create_first_lesson
      LearningTowerTestHelper.create_months_lesson
      visit '/learning_tower/months'
    end

    scenario 'should have months' do
      expect(page).to have_content english_months
    end

    scenario 'should not have "I am"' do
      expect(page).not_to have_content 'I am'
    end

    scenario 'when answered correctly', js: true do
      fill_in 'answer', with: 'Leden'
      click_button 'Check'
      expect(page).to have_content 'nice!'
      expect(page).to have_content 'January Leden'
      expect(find('#question').text).to eq('February')
    end
  end
end

def english_months
  'January February March April May June July August September October November December'
end