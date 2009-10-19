require 'erb'

class OTPKickOff < Thor::Group
  include Thor::Actions
  
  argument :application_name
  argument :author_name
  argument :author_email
  
  #
  # Setup
  #
  
  def self.source_root
    File.expand_path(File.dirname(__FILE__) + '/..')
  end
  
  def self.destination_root
    File.expand_path(File.dirname(OTPKickOff.source_root))
  end
  
  def today
    Date.today
  end
  
  #
  # Steps
  #
  
  def create_application_directories
    empty_directory "#{application_name}/src"
    empty_directory "#{application_name}/ebin"
    empty_directory "#{application_name}/deps"
  end
  
  def create_source_files
    template 'resources/template_app.app',      "#{application_name}/src/#{application_name}_app.app"
    template 'resources/template_app.erl',      "#{application_name}/src/#{application_name}_app.erl"
    template 'resources/template_sup.erl',      "#{application_name}/src/#{application_name}_sup.erl"
    template 'resources/template_server.erl',   "#{application_name}/src/#{application_name}_server.erl"
    template 'resources/template_handler.erl',  "#{application_name}/src/#{application_name}_handler.erl"
    template 'resources/template_appstart.erl', "#{application_name}/src/#{application_name}.erl"
    template 'resources/template_include.hrl',  "#{application_name}/src/#{application_name}.hrl"
  end
end