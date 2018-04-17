#! /usr/bin/env ruby
puts "Requiring..."
require 'mechanize'

# Spezifizieren der Userdaten
username = ""
password = ""

# Generieren eines neuen Mechanize-Agenten
puts "Starting agent..."
a = Mechanize.new {|agent|
  agent.user_agent_alias = 'Mac Safari'
}

# Durchspielen eines regulären Login-Workflows
# Mexx aufrufen
puts "Loading animexx..."
a.get('http://animexx.onlinewelten.com/') do |page|

  # Link zur Loginseite raussuchen und öffnen
  login_page = a.click(page.link_with(:text => /Einloggen/))

  puts "Logging in ..."
  # Loginformular ausfuellen und abschicken. Resultat ist die persoenliche Startseite
  start_page = login_page.form_with(:id => 'login_form') do |f|
    f.login_username = username
    f.login_password = password
  end.click_button

  # Steckbrieflink raussuchen und oeffnen
  puts "Accessing Steckbrief..."
  steckbrief_page = a.click(start_page.link_with(:text => username))

  # Aus dem Steckbrief den Link zur Karobank raussuchen und oeffnen
  karobank_page = a.click(steckbrief_page.link_with(:href => '/items/karo-bank.php'))

  puts "Fetching karotaler..."
  # Mechanize arbeitet ohne Javascript, daher muss in der Karobank das Abholen nochmal explizit bestaetigt werden
  karobank_form = karobank_page.form_with(:action => 'karo-bank.php') do |kf|
  end.click_button

end
