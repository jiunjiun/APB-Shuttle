module Domain
  class Api
    def self.matches?(request)
      request.host == "api.#{Settings.host}"
    end
  end
end
