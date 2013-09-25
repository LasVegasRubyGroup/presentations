class Capitalize
  # Part one (fuzz testing)
  # Given a string, capitalize the first letter of each line.
  def self.capitalize_each_line(s)
    s.split("\n").map { |line|
      line[0] = line[0].upcase
      line
    }.join("\n")
  end

  # Part two (order dependence)
  def self.capitalize_file(filename)
    return capitalize_each_line(File.read(filename))
  end
end
