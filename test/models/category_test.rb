# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  child      :string(255)      not null
#  parent     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
