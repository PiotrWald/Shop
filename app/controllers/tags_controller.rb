# frozen_string_literal: true

class TagsController < ApplicationController
  def show
    @tag = Tag.where(id: params[:id])
              .includes(:products)
              .first
              .decorate
  end
end
