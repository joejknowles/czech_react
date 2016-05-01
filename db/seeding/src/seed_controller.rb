require_relative './vocab_provider'
require_relative './csv_provider'
require_relative './csv_parser'
require './app/src/lesson_input/vocab_creator'

class SeedController
  def self.seed file_name
    csv_provider = CsvProvider.new file_name
    vocab_provider = VocabProvider.new(csv_provider, CsvParser.new)
    vocab = vocab_provider.vocab
    VocabCreator.new.create(file_name, *vocab)
  end
end