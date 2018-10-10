# frozen_string_literal: true

class InvoicesController < ApplicationController
  before_action :set_invoice_service, only: %i[add_product remove_invoice_product]

  # Adds product to invoice and redirects to place where user was before
  def add_product
    product = Product.find(params[:product][:id])
    unless @invoice_service.add_product(product)
      redirect_to products_path
      return
    end

    redirect_to_origin(params[:origin][:code], product)
  end

  def remove_invoice_product
    invoice_product = InvoiceProduct.find(params[:id])
    invoice_service.remove_invoice_product(invoice_product)
    redirect_to @invoice
  end

  def close_invoice
    @invoice = Invoice.find_by(user_id: current_user.id, status: :opened)

    if @invoice.update(status: :closed)
      redirect_to products_path
    else
      redirect_to @invoice
    end
  end

  def show
    @invoice = Invoice.where(id: params[:id]).includes(invoice_products: :product).first
  end

  def index
    @invoices = Invoice.where(user_id: current_user.id)
  end

  private

  # when user adds product invoice is being found/created for him
  def set_invoice_service
    @invoice = Invoice.find_or_create_by(status: :opened, user_id: current_user.id)
    @invoice_service = InvoiceService.new(@invoice)
  end

  def redirect_to_origin(origin, thing)
    case origin
    when '1' then redirect_to products_path
    when '2' then redirect_to thing
    end
  end
end
