# Load the rails application
require File.expand_path('../application', __FILE__)

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

# Initialize the rails application
ContactApp::Application.initialize!

PROJECT_NAME = 'BiCoR'
PROJECT_COMPANY = 'Mike Feustel'
PROJECT_YEAR = '2014'