# frozen_string_literal: true

require "rails_helper"

RSpec.describe SpaceComponent, type: :component do

  it "renders the relevant space data" do
    render_preview(:default)

    expect(page).to have_content('Aardvark Boulevard')
    expect(page).to have_content('Shackleford')
  end
end
