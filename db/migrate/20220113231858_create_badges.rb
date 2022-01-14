class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :badge_id
      t.string :name
      t.string :image_url
      t.string :issuer
      t.string :skill

      t.timestamps
    end
  end
end
