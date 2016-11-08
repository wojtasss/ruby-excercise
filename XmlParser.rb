require 'nokogiri'
require 'open-uri'

class XmlParser
  def self.parse url
    Nokogiri::HTML(open(url))
      .xpath("//tabela[@runda='Runda Zasadnicza']//druzyna")
      .inject([]) do |arr, team|
      arr <<  {
          full_name:          ["Nazwa drużyny:",           team.attr('pelna_nazwa')],
          points:             ["Punkty:",                  team.attr('pkt').to_i],
          number_of_matches:  ["Mecze:",                   team.attr('mecze').to_i],
          win_games:          ["Wygrane:",                 team.attr('zwyciestwa').to_i],
          lose_games:         ["Porażki:",                 team.attr('porazki').to_i],
          home_wins:          ["Wygrane u siebie:",        team.attr('wygrane_dom').to_i],
          home_loses:         ["Przegrane u siebie:",      team.attr('przegrane_dom').to_i],
          away_wins:          ["Wygrane na wyjeździe:",    team.attr('wygrane_wyjazd').to_i],
          away_loses:         ["Przegrane na wyjeździe:",  team.attr('przegrane_wyjazd').to_i],
          scored_points:      ["Zdobyte punkty:",          team.attr('kosze_zdobyte').to_i],
          loses_points:       ["Stracone punkty:",         team.attr('kosze_stracone').to_i],
          ratio_points:       ["Stosunek punktów:",        team.attr('stosunek_zdob_strac').to_f]
        }
      end
  end
end
