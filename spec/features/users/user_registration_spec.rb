require 'rails_helper'

feature 'User Registration' do
  scenario 'successfully' do
    visit root_path

    click_on 'Inscrever-se'

    fill_in 'E-mail', with: 'test@test.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Inscrever-se'

    expect(page).to have_content('Bem vindo!')
  end

  scenario 'failure' do
    visit root_path

    click_on 'Inscrever-se'

    fill_in 'E-mail', with: ''
    fill_in 'Senha', with: ''
    fill_in 'Confirme sua senha', with: ''
    click_on 'Inscrever-se'

    expect(page).to have_content('E-mail não pode ficar em branco')
    expect(page).to have_content('Senha não pode ficar em branco')
  end
end
