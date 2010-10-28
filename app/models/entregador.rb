# == Schema Information
# Schema version: 20101027192309
#
# Table name: entregadors
#
#  id         :integer         not null, primary key
#  nome       :string(255)
#  filial     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Entregador < ActiveRecord::Base
  has_many :cecs
end
