require 'rails_helper'

RSpec.describe 'groups/index.html.erb', type: :feature do
  let(:user) { User.create(name: 'Glenda Diaz', email: 'test@example.com', password: '12345678') }

  before(:each) do
    user.confirm
    sign_in user
    @group = Group.create(name: 'Food', icon: 'https://img.icons8.com/?size=512&id=21575&format=png', author_id: user.id)
    @movement = Movement.create(name: 'Deposit', amount: 100, author_id: user.id, category_id: @group.id)
    @movement2 = Movement.create(name: 'Transfer', amount: 50, author_id: user.id, category_id: @group.id)
    visit user_group_path(user.id, @group.id)
  end

  it 'Shows all transactions that belong to the category' do
    expect(page).to have_content(@group.name)
  end

  it 'Shows the total amount of all transaction in the category' do
    expect(page).to have_content("#{@group.movements.sum { |rf| rf.amount }}")
  end

  it 'Shows the name of the transactions' do
    expect(page).to have_content(@movement.name)
    expect(page).to have_content(@movement2.name)
  end

  it 'Shows the amount of the movements' do
    expect(page).to have_content(@movement.amount)
    expect(page).to have_content(@movement2.amount)
  end

  it 'redirects me to add a new transaction' do
    link = find("a[href='#{new_user_group_movement_path(user.id, @group.id)}']")
    link.click
    expect(page).to have_current_path(new_user_group_movement_path(user.id, @group.id))
  end

end