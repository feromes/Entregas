# == Schema Information
# Schema version: 20101029014204
#
# Table name: entregadors
#
#  id         :integer         not null, primary key
#  nome       :string(255)
#  filial     :integer
#  created_at :datetime
#  updated_at :datetime
#  ativo      :boolean
#

class Entregador < ActiveRecord::Base
  has_many :cecs
  validates_presence_of [:nome, :filial], :message => "can't be blank"
end
