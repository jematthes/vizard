# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( sandboxes.css sandboxes.js)
Rails.application.config.assets.precompile += %w( bpmn.css joint.all.css style.css angular-aside.css)

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( steps.js json2html.js jquery.json2html.js)

Rails.application.config.assets.precompile += %w( step1_2.html)
