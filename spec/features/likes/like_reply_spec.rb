require 'rails_helper'

feature 'Like Reply' do
  scenario '#like reply' do
    user = create(:user)
    login_as(user)
    twiit = create(:twiit)
    reply = create(:reply, replieable: twiit)

    visit twiit_path(twiit)

    within '.reply' do
      click_on 'Like'
    end

    user.reload
    expect(user.liked?(reply)).to be_truthy
    expect(page).to have_link('Like')
    expect(page).not_to have_link('Unlike')
  end
end
