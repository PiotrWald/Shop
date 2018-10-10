# frozen_string_literal: true

class TagDecorator < ApplicationDecorator
  delegate_all

  def body
    '#' + object.body
  end
end
