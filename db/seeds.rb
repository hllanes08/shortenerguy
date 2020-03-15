require 'faker'
(0..200).each do |i|
  Shortcode.create(code: Faker::Alphanumeric.alpha(number: 4), url: Faker::Internet.domain_name, name: Faker::Internet.domain_word, occurrences: Random.rand(100))
end

