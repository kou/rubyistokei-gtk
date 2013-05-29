#!/usr/bin/env ruby
#
# Copyright (C) 2013  Kouhei Sutou <kou@cozmixng.org>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require "bundler"
Bundler.require

require "webkit-gtk"

window = Gtk::Window.new
window.keep_above = true
# window.decorated = false

web_view = WebKitGtk::WebView.new
web_view.load_uri("http://rubyistokei.herokuapp.com/")
window.add(web_view)

window.signal_connect("key-release-event") do |_, event|
  handled = false
  case event.keyval
  when Gdk::Keyval::GDK_KEY_q, Gdk::Keyval::GDK_KEY_Escape
    window.destroy
    handled = true
  end
  handled
end

window.signal_connect("destroy") do
  Gtk.main_quit
end

window.show_all

Gtk.main
