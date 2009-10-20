require 'rubygems'
require 'thor'
require 'yaml'

#
# Path to configuration file
#
CONFIGURATION_FILE = '~/.otp_kickoff'

#
# Thor classes, the magic of tasks!
#
class OTPKickOff < Thor
  include Thor::Actions
  
  #
  # Setup
  #
  
  def self.source_root
    File.expand_path(File.dirname(__FILE__) + '/..')
  end
  
  def self.destination_root
    File.expand_path(File.dirname('.'))
  end
  
  #
  # Tasks
  #

  no_tasks { attr_accessor :application_name, :author_name, :author_email, :today }
  
  # task: configure
  
  desc 'configure --author=AUTHOR --email=AUTHOR_EMAIL', 'configure informations about author'
  method_options :author => :string, :email => :string
  
  def configure
    #set data about author
    @author_name  = options[:author]
    @author_email = options[:email]
    
    create_file CONFIGURATION_FILE do
      %Q{
author_name: #{author_name}
author_email: #{author_email}
      }
    end
  end
  
  # task: new_application
  
  desc 'new_application --name=APPLICATION_NAME', 'generate a new Erlang/OTP application stub'
  method_options :name => :string
  
  def new_application
    # set data to templates
    @application_name = options[:name]
    
    config_info   = ConfigInfo.new
    @author_name  = config_info.author_name
    @author_email = config_info.author_email
    
    @today = Date.today
    
    # generate templates
    template 'resources/template_app.app',      "#{application_name}/src/#{application_name}_app.app"
    template 'resources/template_app.erl',      "#{application_name}/src/#{application_name}_app.erl"
    template 'resources/template_sup.erl',      "#{application_name}/src/#{application_name}_sup.erl"
    template 'resources/template_server.erl',   "#{application_name}/src/#{application_name}_server.erl"
    template 'resources/template_handler.erl',  "#{application_name}/src/#{application_name}_handler.erl"
    template 'resources/template_appstart.erl', "#{application_name}/src/#{application_name}.erl"
    template 'resources/template_include.hrl',  "#{application_name}/src/#{application_name}.hrl"

    # create required directories
    empty_directory "#{application_name}/ebin"
    empty_directory "#{application_name}/deps"
    empty_directory "#{application_name}/priv"
  end
end

#
# Helper class to get informations from configuration file (~/.otp_kickoff)
#
class ConfigInfo
  attr_accessor :author_name, :author_email
  
  def initialize
    begin
      info = YAML.load_file(File.expand_path(CONFIGURATION_FILE))
    rescue
      puts "I'm sorry but the configuration file doesn't exists."
      puts "Please run the command below:"
      puts "  otp_kickoff configure --author=YOUR_NAME --email=YOUR_EMAIL"
      
      exit 0
    end
    
    @author_name  = info["author_name"]
    @author_email = info["author_email"]
  end
end