require 'rails_helper'

RSpec.describe "users/show.html.slim", type: :view do
  it 'shows the user name' do
    assign(:user, User.create(name: 'foo'))

    render

    expect(rendered).to match /foo/
  end
end
