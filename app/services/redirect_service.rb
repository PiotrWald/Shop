# frozen_string_literal: true

class RedirectService
  def renew_user_state(origin)
    case origin[:code]
    when 1 # products#show
      redirect_to product_path(orign[:id])
    else
      redirect_to products_path
    end
  end
end
