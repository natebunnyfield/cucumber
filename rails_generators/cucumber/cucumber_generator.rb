require 'rbconfig'

# This generator bootstraps a Rails project for use with Cucumber
class CucumberGenerator < Rails::Generator::Base
  DEFAULT_SHEBANG = File.join(Config::CONFIG['bindir'],
                              Config::CONFIG['ruby_install_name'])
  def manifest
    record do |m|
      script_options     = { :chmod => 0755, :shebang => options[:shebang] == DEFAULT_SHEBANG ? nil : options[:shebang] }

      m.directory 'features/step_definitions'
      m.directory 'features/support'
      m.file      'env.rb', 'features/support/env.rb'
      m.file      'webrat_common.rb', 'features/step_definitions/webrat_common.rb'

      m.directory 'lib/tasks'
      m.file      'cucumber.rake', 'lib/tasks/cucumber.rake'
      m.file      'cucumber',      'script/cucumber',        script_options
    end
  end

protected

  def banner
    "Usage: #{$0} cucumber"
  end

end