require 'rubygems'
require 'thor'
require 'yaml'

#
# Path to configuration file
#
CONFIGURATION_FILE = '~/.otp_kickoff'
TODAY              = Date.today

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

  no_tasks { attr_accessor :author_name, :author_email }

  no_tasks { attr_accessor :application_name, :supervisor_name, :server_name, :handler_name }
  
  # task: configure
  
  desc 'configure', 'configure informations about author'
  method_option :author, :type => :string, :required => true
  method_option :email,  :type => :string, :required => true
  
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
  
  desc 'new_application', 'generate a new Erlang/OTP application stub'
  method_option :name, :type => :string, :required => true, :aliases => "-n"
  
  def new_application
    # set data to templates
    @application_name = options[:name]
    @supervisor_name  = @application_name
    @server_name      = @application_name
    
    @author_name, @author_email = get_config_info
        
    # generate templates
    template 'resources/template.app',          "#{application_name}/src/#{application_name}.app"
    template 'resources/template_app.erl',      "#{application_name}/src/#{application_name}_app.erl"
    template 'resources/template_sup.erl',      "#{application_name}/src/#{application_name}_sup.erl"
    template 'resources/template_server.erl',   "#{application_name}/src/#{application_name}_server.erl"
    template 'resources/template_appstart.erl', "#{application_name}/src/#{application_name}.erl"
    template 'resources/template_include.hrl',  "#{application_name}/src/#{application_name}.hrl"
    
    # create required directories
    empty_directory "#{application_name}/ebin"
    empty_directory "#{application_name}/deps"
    empty_directory "#{application_name}/priv"
  end
  
  # task: new_supervisor
  
  desc 'new_supervisor', 'generate a new Erlang/OTP supervisor stub'
  method_option :name, :type => :string, :required => true, :aliases => "-n"
  method_option :application_name, :type => :string, :required => true, :aliases => "-a"
  
  def new_supervisor
    # set data to templates
    @supervisor_name  = options[:name]
    @application_name = options[:application_name]
    
    @author_name, @author_email = get_config_info
    
    # generate templates
    template 'resources/template_sup.erl', "#{supervisor_name}_sup.erl"
  end
  
  # task: new_gen_server
  
  desc 'new_gen_server', 'generate a new Erlang/OTP gen_server stub'
  method_option :name, :type => :string, :required => true, :aliases => "-n"
  
  def new_gen_server
    # set data to templates
    @server_name = options[:name]
    
    @author_name, @author_email = get_config_info
    
    # generate templates
    template 'resources/template_server.erl', "#{server_name}_server.erl"
  end
  
  # task: new_gen_server
  
  desc 'new_event_handler', 'generate a new Erlang/OTP gen_event handler stub'
  method_option :name, :type => :string, :required => true, :aliases => "-n"
  
  def new_event_handler
    # set data to templates
    @handler_name = options[:name]
    
    @author_name, @author_email = get_config_info
    
    # generate templates
    template 'resources/template_handler.erl', "#{handler_name}_handler.erl"
  end
  
  private
  
    def get_config_info
      config_info = ConfigInfo.new
      
      return config_info.author_name, config_info.author_email
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