require 'gtk2'

module UsuallyNote
  class Application

    attr_accessor :window

    def initialize
      @window = Gtk::Window.new
      add_buttons
    end
    
    def start
      @window.show_all
      Gtk.main
    end

    private

    def add_buttons
      button = Gtk::Button.new('Hello World')
      button.signal_connect('clicked') do
        puts 'foo!'
      end
      window.add(button)
    end
  end
end
