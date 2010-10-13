class AddNumeroToCec < ActiveRecord::Migration
  def self.up
    add_column :cecs, :numero, :integer
    
    Cec.find(:all).each do |cec|
      numero = cec.complemento.to_i
      numero = 0 if numero.nil?
      cec.update_attribute(:numero, numero)
      # cec.numero = cec.complemento.to_i unless numero.nil?
      #       cec.save!
    end
  end

  def self.down
    remove_column :cecs, :numero
  end
end
