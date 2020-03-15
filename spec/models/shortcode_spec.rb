require 'rails_helper'
require 'faker'

RSpec.describe Shortcode, :type => :model do
  context 'validation test' do
    it 'ensures code presence' do
      sc = Shortcode.new(code: Faker::Alphanumeric.alpha(number: 4), url: Faker::Internet.domain_name).save
      expect(sc).to eq(true)
      
      sc1 = Shortcode.new(url: Faker::Internet.domain_name).save
      expect(sc1).to eq(false)
    end
    
    it 'ensures url presence' do
      sc = Shortcode.new(code: Faker::Alphanumeric.alpha(number: 4), url: Faker::Internet.domain_name).save
      expect(sc).to eq(true)
      
      sc1 = Shortcode.new(code: Faker::Alphanumeric.alpha(number: 4)).save
      expect(sc1).to eq(false)
    end

  end
end
