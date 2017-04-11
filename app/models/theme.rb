# == Schema Information
#
# Table name: themes
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Theme < ActiveRecord::Base
end
