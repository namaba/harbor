# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
	
end
