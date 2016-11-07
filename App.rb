require 'nokogiri'
require 'open-uri'
require_relative 'TeamsTable'
require_relative 'XmlParser'

class App
  @@url = 'http://www.plk.pl/tmp/tabela.xml'

  def initialize
    @teams_table = TeamsTable.new XmlParser.parse @@url
    main_loop
  end

  def main_loop
    loop do
      puts "Tabela\n"
      @teams_table.show_table
      puts "\nWybierz drużynę aby pokazać więcej statystyk (0 kończy program):"
      id = gets.chomp.to_i

      if id == 0
        puts 'Koniec programu'
        break
      elsif id <= @teams_table.teams_statistics.length
        puts
        @teams_table.show_team id
        puts "\nWciśnij dowolny klawisz aby kontynuować..."
        gets.chomp
      else
        puts "\nBrak drużyny o takiej pozycji!"
        puts "Wciśnij dowolny klawisz aby kontynuować..."
        gets.chomp
      end
    end
  end
end

App.new
