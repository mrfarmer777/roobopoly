# frozen_string_literal: true

class PlayerTokenComponent < ViewComponent::Base
  attr_reader :name


  def initialize(name:)
    @name = name
  end

  def call
    content_tag 'sl-badge', pill: true, class: "player-token" do
      name
    end
  end

end
