# Load the rails application
require File.expand_path('../application', __FILE__)

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

# Initialize the rails application
ContactApp::Application.initialize!

PROJECT_NAME = 'BiCoRem'
PROJECT_COMPANY = 'Benno Schilling, Markus Hinkelmann, Mike Feustel'
PROJECT_YEAR = '2014'

FLAG_DE = '1393612945_Germany.png'
FLAG_EN = '1393612815_United-Kingdom.png'

STRING_VERSION_NUMBER = '1.0.0'
STRING_VERSION_DATE = '14.03.2014'