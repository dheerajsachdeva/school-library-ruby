require_relative 'display_ui'

class HandleOptions
  def initialize(app)
    @app = app
    @display_ui = DisplayUI.new(app)
  end

  def display
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def run_app
    menu_options = {
      '1' => :list_all_books,
      '2' => :list_all_peoples,
      '3' => :create_person,
      '4' => :create_book,
      '5' => :create_rental,
      '6' => :list_rentals,
      '7' => :exit
    }
    loop do
      display
      input = gets.chomp
      if menu_options.key?(input)
        run = menu_options[input]
        @display_ui.send(run)
        break if run == 'exit'
      else
        puts 'Enter the correct option: '
      end
    end
  end
end
