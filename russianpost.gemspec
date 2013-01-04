require 'date'
require './lib/russianpost/version'

Gem::Specification.new do |s|
  s.name        = 'russianpost'
  s.version     = RussianPost::VERSION
  s.date        = Date.today.to_s
  s.summary     = 'Russian Post tracking API'
  s.description = 'Russian Post tracking API ported to Ruby, inspired by https://github.com/InJapan/russianpost-tracking'
  s.authors     = ['m16a1']
  s.email       = 'a741su@gmail.com'
  s.files       = Dir['lib/**/*', 'spec/**/*']
  s.homepage    = 'https://github.com/m16a1/russianpost'
end