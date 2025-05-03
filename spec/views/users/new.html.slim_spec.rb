require 'rails_helper'

RSpec.describe "users/new.html.slim", type: :view do
  it 'shows the user name' do
    assign(:user, User.new)

    render

    expect(rendered).to match /Enter user name/
    expect(rendered).to have_selector("input[type='text']")
    expect(rendered).to have_selector("input[type='submit']")
  end
end
