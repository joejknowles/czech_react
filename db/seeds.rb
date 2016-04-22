# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require_relative './seed_files/time_sentences'
require_relative './seed_files/adjectives'

Seeds::TimeSentences.add_all

#adjectives
Seeds::Adjectives.add_all
#verbs
# LearnHelper.create_question english_sentence: 'I am', czech_sentence: 'jsem'
# LearnHelper.create_question english_sentence: 'You are', czech_sentence: 'jsi'

#time
