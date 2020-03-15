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
require 'test_helper'

class ShortcodeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
