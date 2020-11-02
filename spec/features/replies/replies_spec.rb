require 'rails_helper'

feature 'Replies' do
  scenario 'must be logged in' do
    twiit = create(:twiit)

    visit twiit_path(twiit)

    expect(current_path).to eq(new_user_session_path)
  end

  scenario 'show replies' do
    user = create(:user)
    login_as(user)
    other_user = create(:user)
    twiit = create(:twiit)
    reply = Reply.create!(body: 'replied', user: other_user, replieable: twiit)

    visit twiit_path(twiit)

    expect(page).to have_content(twiit.text)
    expect(page).to have_content(reply.body)
  end
end
