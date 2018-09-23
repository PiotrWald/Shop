# frozen_string_literal: true

class InvoiceController < ApplicationController
  before_action :set_invoice_service, only: :add_product

  def add_product
    product = Product.find(params[:id])
    RedirectService.new.renew_user_state(params[:origin]) if @invoice_service.add_product(product)
  end

  private

  def set_invoice_service
    @invoice_service = InvoiceService.new(Invoice.find_or_create_by(
                                            status: :opened,
                                            user_id: current_user.id
                                          ))
  end
end
