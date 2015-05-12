Capybara.asset_host = 'http://localhost:3000'

# Change default browser from firefox to chrome
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
