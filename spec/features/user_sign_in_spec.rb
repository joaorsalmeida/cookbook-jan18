require 'rails_helper'

feature 'User sign in' do
  scenario 'successfully' do
    User.create(email: 'joao@email.com', password: '12345678')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'joao@email.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Logar'

    expect(page).to have_css('nav', text: 'Bem-vindo joao@email.com')
    expect(page).not_to have_link('Entrar')
    expect(page).to have_link('Sair')
  end
end
