require 'rails_helper'
RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'Glenda Diaz', email: 'test@example.com', password: '12345678') }

  it 'user should be valid' do
    expect(user).to be_valid
  end

  it 'if name is not present, user must not be valid' do
    user.name = nil
    expect(user).to_not be_valid
  end
end