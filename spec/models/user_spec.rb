require 'rails_helper'

describe User do
  it 'capitalizes name' do
    user = User.new
    user.name = 'wendy kurniawan'
    user.email = 'wendy.kurniawan@example.com'
    user.password = 'Password123'
    user.save!

    expect(user).to be_persisted
    expect(user.name).to eq 'Wendy Kurniawan'
  end

  it 'has password' do
    user = User.new
    user.name = 'wendy kurniawan'
    user.email = 'wendy.kurniawan@example.com'
    user.save

    expect(user.errors).to include :password
  end

  it 'has name' do
    user = User.new
    user.name = ''
    user.password = 'Password123'
    user.save

    expect(user.errors).to include :name
  end
end
