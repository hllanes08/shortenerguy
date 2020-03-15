require 'rails_helper'
require 'faker'
RSpec.describe Api::ShortenerController, type: :controller do
  before(:all) do
    (0..200).each do |i|
    Shortcode.create(code: Faker::Alphanumeric.alpha(number: 4), url: Faker::Internet.domain_name, name: Faker::Internet.domain_word, occurrences: Random.rand(100))
  end
  end

  it 'Retrieve top records' do
    get :index
    byebug
    expect(response).to include('success:true')
  end
end
