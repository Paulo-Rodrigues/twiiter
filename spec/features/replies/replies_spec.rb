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

  scenario 'create twiit reply' do
    user = create(:user)
    login_as(user)
    twiit = create(:twiit)

    visit twiit_path(twiit)

    within '#reply_twiit_form' do
      fill_in 'Body', with: 'Replied'
      click_on 'Enviar'
    end

    expect(page).to have_content('Replied')
    expect(page).to have_content('Resposta enviada')
  end

  scenario 'show reply for a reply' do
    user = create(:user)
    login_as(user)
    twiit = create(:twiit)
    reply = Reply.create!(body: 'replied', user: twiit.user, replieable: twiit)
    Reply.create!(body: 'other', user: user, replieable: reply)

    visit twiit_path(twiit)

    expect(page).to have_content('other')
  end

  scenario 'create reply for a reply' do
    user = create(:user)
    login_as(user)
    twiit = create(:twiit)
    Reply.create!(body: 'replied', user: twiit.user, replieable: twiit)

    visit twiit_path(twiit)

    within '#reply_for_reply_form' do
      fill_in 'Body', with: 'Replied a Reply'
      click_on 'Enviar'
    end

    expect(page).to have_content('Replied a Reply')
  end
end
