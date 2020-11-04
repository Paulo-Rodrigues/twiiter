require 'rails_helper'

feature 'Like Twiit' do
  scenario '#like (feed)' do
    user = create(:user)
    login_as(user)
    twiit = create(:twiit)

    visit root_path

    click_on 'Like'

    user.reload
    expect(user.liked?(twiit)).to be_truthy
    expect(page).not_to have_link('Like')
    expect(page).to have_link('Unlike')
  end

  scenario '#like (feed)' do
    user = create(:user)
    login_as(user)
    twiit = create(:twiit)
    user.like(twiit)

    visit root_path

    click_on 'Unlike'

    user.reload
    expect(user.liked?(twiit)).to be_falsey
    expect(page).to have_link('Like')
    expect(page).not_to have_link('Unlike')
  end
end
