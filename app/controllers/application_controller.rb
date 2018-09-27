# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_current_invoice

  private

  def set_current_invoice
    return unless user_signed_in?

    @current_invoice = Invoice.where(user_id: current_user.id, status: :opened)
                              .includes(:invoice_products)
                              .first
  end
end
