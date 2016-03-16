module PageHelper

  def api_url
    if Rails.env.production?
      "http://api.apb-shuttle.info"
    else
      "http://api.apb.dev"
    end
  end
end
