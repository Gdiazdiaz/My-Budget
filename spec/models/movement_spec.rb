require 'rails_helper'
RSpec.describe Movement, type: :model do
  let(:user) { User.create(name: 'Glenda Diaz', email: 'test@example.com', password: '12345678') }
  let(:group) { Group.create(name: 'Food', icon: 'https://img.icons8.com/?size=512&id=21575&format=png', author_id: user.id) }
  let(:movement) {Movement.create(name: 'Coffee at Starbucks', amount: 100, author_id: user.id, category_id: group.id) }

  it 'movement should be valid' do
    expect(movement).to be_valid
  end

  it 'if name is not present, movement must not be valid' do
    movement.name = nil
    expect(movement).to_not be_valid
  end

  it 'if amount is less than zero , group must not be valid' do
    movement.amount = -50
    expect(movement).to_not be_valid
  end
end