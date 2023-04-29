require 'rails_helper'
RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'Glenda Diaz', email: 'test@example.com', password: '12345678') }
  let(:group) { Group.create(name: 'Food', icon: 'https://img.icons8.com/?size=512&id=21575&format=png', author_id: user.id) }

  it 'group should be valid' do
    expect(group).to be_valid
  end

  it 'if name is not present, group must not be valid' do
    group.name = nil
    expect(group).to_not be_valid
  end

  it 'if icon is not present, group must not be valid' do
    group.icon = nil
    expect(group).to_not be_valid
  end
end