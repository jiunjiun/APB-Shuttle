# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( index.js refresh_page.js )
Rails.application.config.assets.precompile += %w( admin.js admin.css sign_in.css sign_in.js doc.css doc.js)
Rails.application.config.assets.precompile += %w( error.js error.css)
