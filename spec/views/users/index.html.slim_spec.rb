require 'rails_helper'

RSpec.describe "users/index.html.slim", type: :view do
  it 'lists all of the users' do
    assign(:users, [User.create(name: 'foo'), User.create(name: 'bar')])

    render

    expect(rendered).to match /foo/
    expect(rendered).to match /bar/
  end
end
