require 'rails_helper'

feature 'Homepage' do
  scenario 'returns status 200' do
    visit root_path

    expect(page).to have_http_status(200)
  end
end
