class CreateCharacterBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :character_badges do |t|
      t.integer :badge_id
      t.integer :character_id
      t.string :recipient_email
      t.string :issued_to_first_name
      t.string :issued_to_last_name
      t.string :badge_template_id
      t.timestamp :issued_at

      t.timestamps
    end
  end
end
