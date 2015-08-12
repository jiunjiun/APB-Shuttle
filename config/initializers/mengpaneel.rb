Mengpaneel.configure do |config|
  config.token = Settings.mixpanel.token # or use ENV["MIXPANEL_TOKEN"] if you're into 12-factor. It's not set automatically though, you still have to put that line.
end
