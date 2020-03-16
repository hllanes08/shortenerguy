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

   Shortcode.create(code: 'abc123', url: 'www.google.com')

  it 'Search record' do
    get :resolve, params: { :code => 'abc123' }
  
    expect(response.body).to include_json(success:true)
  end

  it 'Search not existed record' do
    get :resolve, params: { :code => 'xyaz123' }
  
    expect(response.body).to include_json(success:false)
  end

  it 'Create new record' do
    post :create, params: { shortcode: { code: 'efg456', url: 'www.anyurl.com' } }
    expect(response.body).to include_json(success:true)

  end

  it 'Create new record without url' do
    post :create, params: { shortcode: { code: 'efg456'} }
    expect(response.body).to include_json(success:false)
  end

  it 'Create new record without code' do
    post :create, params: { shortcode: { url: 'www.anyurl.com'} }
    expect(response.body).to include_json(success:false)

  end


end
