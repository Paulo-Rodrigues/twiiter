require 'rails_helper'

feature 'Profile' do
  scenario 'user has a profile when register' do
    visit new_user_registration_path

    fill_in 'E-mail', with: 'email@test.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Inscrever-se'

    expect(Profile.count).to eq(1)
  end

  scenario 'must be logged in to see profile' do
    user = create(:user)

    visit user_profile_path(user, user.profile)

    expect(current_path).to eq(new_user_session_path)
  end

  scenario 'must be logged in to edit profile' do
    user = create(:user)

    visit edit_user_profile_path(user, user.profile)

    expect(current_path).to eq(new_user_session_path)
  end

  scenario 'show profile' do
    profile = create(:profile)
    user = profile.user
    login_as(user)

    visit user_profile_path(user, profile)

    expect(page).to have_content(profile.first_name)
    expect(page).to have_content(profile.last_name)
    expect(page).to have_content(profile.bio)
  end

  scenario 'user edit profile' do
    user = create(:user)
    login_as(user)

    visit root_path

    click_on 'Perfil'
    click_on 'Editar Perfil'

    fill_in 'Nome', with: 'Primeiro nome'
    fill_in 'Sobrenome', with: 'Sobrenome'
    fill_in 'Bio', with: 'Lorem'
    click_on 'Enviar'

    expect(page).to have_content('Primeiro nome')
    expect(page).to have_content('Sobrenome')
    expect(page).to have_content('Lorem')
  end
end
