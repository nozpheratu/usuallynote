lib = File.expand_path('../lib', __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rubygems'
require 'bundler/setup'
require 'usuallynote'
require 'gtk2'
require 'pry'

# window = Gtk::Window.new
# window.show
# Gtk.main
#

app = UsuallyNote::Application.new
 app.start
