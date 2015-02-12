# Download with a browser different than Fierfox (e.g. Chrome) from: https://addons.mozilla.org/firefox/downloads/latest/967/addon-967-latest.xpi?src=dp-btn-primary
# Save the file into a folder of your project, e.g. support/firefox/addon

require 'selenium-webdriver'


# Define a profile
@profile = Selenium::WebDriver::Firefox::Profile.new


# Add the extension to the downloaded file
@profile.add_extension('support/firefox/addonmodify_headers-0.7.1.1-fx.xpi')
@profile['modifyheaders.config.active'] = true
@profile['modifyheaders.config.alwaysOn'] = true
@profile['modifyheaders.config.openNewTab'] = true
@profile['modifyheaders.start'] = true

@profile['modifyheaders.headers.count'] = 1
@profile['modifyheaders.headers.action0'] = 'Add'
@profile['modifyheaders.headers.name0'] = 'The key of the header you want to add'
@profile['modifyheaders.headers.value0'] = 'The value of the header you want to use'
@profile['modifyheaders.headers.enabled0'] = true


# Open Firefox browser with configured profile
@browser = Selenium::WebDriver.for :firefox, :profile => @profile

@browser.get "http://github.com/romgrod"

# Check the new header with the browser console (Network)