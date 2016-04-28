require 'rails_helper'

feature 'home' do
  before do
    Rails.application.load_seed
    visit '/'
  end
  scenario 'displays lessons' do
    expect(page).to have_link 'days'
    expect(page).to have_link 'months'
  end
end