# == Schema Information
#
# Table name: talents
#
#  id            :bigint           not null, primary key
#  image         :string(255)
#  instagram_url :string(255)
#  memo          :text(65535)
#  name          :string(255)      not null
#  youtube_url   :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'test_helper'

class TalentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
