# frozen_string_literal: true

class InvoicesController < ApplicationController
  before_action :set_invoice, only: :add_product

  # Adds product to invoice and redirects to place where user was before
  def add_product
    product = Product.find(params[:product][:id])
    redirect_to products_path unless @invoice_service.add_product(product).valid?

    case params[:origin][:code]
    when '1' then redirect_to products_path
    end
  end

  private

  # when user adds product invoice is being found/created for him
  def set_invoice
    invoice = Invoice.find_or_create_by(status: :opened, user_id: current_user.id)
    @invoice_service = InvoiceService.new(invoice)
  end
end
