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

  context 'create Twiits' do
    scenario 'create' do
      user = create(:user)
      login_as(user)

      visit root_path

      fill_in 'twiit', with: 'My Twiit'
      click_on 'TWIIT'

      expect(page).to have_content('My Twiit')
      expect(page).to have_content('Postado')
    end

    scenario 'failure' do
      user = create(:user)
      login_as(user)

      visit root_path

      fill_in 'twiit', with: ''
      click_on 'TWIIT'

      expect(page).to have_content('não pode ficar em branco')
    end
  end

  context 'delete twiits' do
    scenario 'seccessfully' do
      user = create(:user)
      login_as(user)
      twiit = create(:twiit, user: user)

      visit root_path
      click_on 'Delete twiit'

      expect(page).to have_content('Deletado')
      expect(page).not_to have_content(twiit.text)
    end

    scenario 'must be owner' do
      user = create(:user)
      other_user = create(:user)
      login_as(other_user)
      create(:twiit, user: user)

      visit root_path

      expect(page).not_to have_link('Delete twiit')
    end
  end
end
