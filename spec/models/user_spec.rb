require 'rails_helper'

describe User do
  let(:user) { User.new }

  it 'capitalizes name' do
    user.name = 'wendy kurniawan'
    user.email = 'wendy.kurniawan@example.com'
    user.password = 'Password123'
    user.save!

    expect(user).to be_persisted
    expect(user.name).to eq 'Wendy Kurniawan'
  end

  it 'has password' do
    user.name = 'wendy kurniawan'
    user.email = 'wendy.kurniawan@example.com'
    user.save

    expect(user.errors).to include :password
  end

  it 'has name' do
    user.name = ''
    user.password = 'Password123'
    user.save

    expect(user.errors).to include :name
  end
end
