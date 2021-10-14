# frozen_string_literal: true

feature 'index page' do
  scenario 'displays a welcome message' do
    visit('/')
    expect(page).to have_content('Bookmark Manager App')
  end
end
