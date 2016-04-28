class VocabProvider
  def initialize csv_provider, parser
    @csv_provider = csv_provider
    @parser = parser
  end

  def vocab
    contents = @csv_provider.contents
    @parser.parse contents
  end
end