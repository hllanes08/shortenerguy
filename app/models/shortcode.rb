# == Schema Information
#
# Table name: shortcodes
#
#  id          :bigint           not null, primary key
#  code        :string
#  url         :string
#  name        :string
#  occurrences :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Shortcode < ApplicationRecord
  validates_presence_of :code, :url
end
