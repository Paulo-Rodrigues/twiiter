require 'rails_helper'

feature 'User Login' do
  scenario 'successfully' do
    user = create(:user)
    visit root_path

    click_on 'Entrar'

    fill_in 'E-mail', with: user.email
    fill_in 'Senha', with: user.password

    click_on 'Login'

    expect(page).to have_content('Login efetuado com sucesso')
  end

  scenario 'failure' do
    create(:user)
    visit root_path

    click_on 'Entrar'

    fill_in 'E-mail', with: ''
    fill_in 'Senha', with: ''

    click_on 'Login'

    expect(page).to have_content('E-mail ou senha inválidos')
  end

  scenario 'after sig in redirect to twiits page' do
    user = create(:user)

    visit root_path

    click_on 'Entrar'

    fill_in 'E-mail', with: user.email
    fill_in 'Senha', with: user.password

    click_on 'Login'

    expect(current_path).to eq(twiits_path)
  end

  scenario 'already logged in user twiits page(root)' do
    user = create(:user)
    login_as(user)

    visit root_path

    expect(current_path).to eq('/')
  end
end
