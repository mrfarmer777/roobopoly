require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'POST /users' do
    it 'creates a user' do
      post '/users', params: { user: { name: 'foo' } }

      user = User.last
      expect(user.name).to eq('foo')
      user_path = user_path(user)
      expect(response).to redirect_to(user_path)
    end
  end

  describe 'DELETE /users/:id' do
    it 'deletes a user' do
      user = User.create(name: 'foo')
      delete "/users/#{user.id}"

      expect(User.count).to eq(0)
      expect(response).to redirect_to(users_path)
    end
  end

end
