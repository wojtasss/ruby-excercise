class TeamsTable
  attr_reader :teams_statistics

  def initialize teams_statistics
    @teams_statistics = teams_statistics
  end

  def show_table
    @teams_statistics.each_with_index do |team, index|
      printf "%2d %s\n", index+1, team[:full_name][1]
    end
  end

  def show_team index
    @teams_statistics[index-1].each_value do |value|
      if value[1].is_a? Fixnum
        printf "%-25s %d\n", value[0], value[1]
      elsif value[1].is_a? String
        printf "%-25s %s\n", value[0], value[1]
      elsif value[1].is_a? Float
        printf "%-25s %f\n", value[0], value[1]
      end
    end
  end
end
