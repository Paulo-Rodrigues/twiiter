require 'rails_helper'

feature 'Twiits' do
  scenario 'must b logged in' do
    twiit = create(:twiit)

    visit twiits_path

    expect(page).not_to have_content(twiit.text)
  end

  scenario 'show twiit' do
    user = create(:user)
    login_as(user)
    twiit = create(:twiit, user: user)

    visit root_path

    expect(page).to have_content(twiit.text)
  end
end
