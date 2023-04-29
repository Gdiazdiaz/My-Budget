require 'rails_helper'

RSpec.describe 'groups/index.html.erb', type: :feature do
  let(:user) { User.create(name: 'Glenda Diaz', email: 'test@example.com', password: '12345678') }

  before(:each) do
    user.confirm
    sign_in user
    @group = Group.create(name: 'Food', icon: 'https://img.icons8.com/?size=512&id=21575&format=png',
                          author_id: user.id)
    @group2 = Group.create(name: 'Bank', icon: 'https://img.icons8.com/?size=512&id=21575&format=png',
                           author_id: user.id)
    visit user_groups_path(user.id)
  end

  it 'Shows all categories that belong to the user' do
    expect(page).to have_content('Categories')
  end

  it 'Shows the name of the categories' do
    expect(page).to have_content(@group.name)
  end

  it 'Shows the icon of the categories' do
    expect(page).to have_selector("img[src*='#{@group.icon}']")
    expect(page).to have_selector("img[src*='#{@group2.icon}']")
  end

  it 'Shows the amount of movements of the categories' do
    expect(page).to have_content(@group.movements.count.to_s)
    expect(page).to have_content(@group2.movements.count.to_s)
  end

  it 'redirects me to the ransactions age for a specific category' do
    link = find("a[href='#{user_group_path(@group.author.id, @group.id)}']")
    link.click
    expect(page).to have_current_path(user_group_path(@group.author.id, @group.id))
  end

  it 'redirects me to add a new category' do
    link = find("a[href='#{new_user_group_path(user.id)}']")
    link.click
    expect(page).to have_current_path(new_user_group_path(user.id))
  end
end
