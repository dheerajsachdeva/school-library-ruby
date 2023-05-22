require_relative 'app'
require_relative 'handle_options'


def main
  app = App.new
  handle_options = HandleOptions.new(app)
  puts 'Welcome to the School Library App!'
  handle_options.run_app
 end

main
