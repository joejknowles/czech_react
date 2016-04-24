# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require_relative './seed_files/time_sentences'
require_relative './seed_files/adjectives'
require './app/src/lesson_input/vocab_creator'


#adjectives
Seeds::Adjectives.add_all
#verbs

#time
Seeds::TimeSentences.add_all