class CsvParser
  def parse csv
    csv[1..-1].map do |row|
      [row[0], row[1..-1]]
    end
  end
end