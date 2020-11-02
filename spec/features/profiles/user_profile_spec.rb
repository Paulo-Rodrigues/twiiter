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
end
