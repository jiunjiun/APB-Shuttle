# -*- encoding : utf-8 -*-
class Settings < Settingslogic
  source "#{Rails.root}/config/application.yml"
  namespace Rails.env

  def self.host
    Settings.domain.host
  end
end
