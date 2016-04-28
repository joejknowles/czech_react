require 'rails_helper'
require './db/seeding/src/vocab_provider'

RSpec.describe VocabProvider do
  let(:provider) { double('provider', contents: 'csv contents') }
  let(:parser) { double('parser', parse: '') }
  subject { VocabProvider.new provider, parser }

  it 'passes csv contents into parser' do
    expect(provider).to receive(:contents)
    expect(parser).to receive(:parse) { 'csv contents'}
    subject.vocab
  end
end
