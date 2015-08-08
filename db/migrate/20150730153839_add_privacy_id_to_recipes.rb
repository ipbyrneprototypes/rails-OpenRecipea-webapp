class AddPrivacyIdToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :privacy_id, :integer
  end
end
