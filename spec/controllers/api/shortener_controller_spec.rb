require 'rails_helper'
require 'faker'
require "rspec/json_expectations"
RSpec.describe Api::ShortenerController, type: :controller do
  before(:all) do
    (0..200).each do |i|
    Shortcode.create(code: Faker::Alphanumeric.alpha(number: 4), url: Faker::Internet.domain_name, name: Faker::Internet.domain_word, occurrences: Random.rand(100))
  end
  end

  it 'Retrieve top records' do
    get :index
  
    expect(response.body).to include_json(success:true)
  end
end
