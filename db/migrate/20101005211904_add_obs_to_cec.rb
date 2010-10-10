class AddObsToCec < ActiveRecord::Migration
  def self.up
    add_column :cecs, :observacao, :text
  end

  def self.down
    remove_column :cecs, :observacao
  end
end
