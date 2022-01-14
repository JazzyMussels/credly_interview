require 'date'
require 'rest-client'
require 'base64'
require_relative '../../.api_key.rb'

class Character < ApplicationRecord
    has_many :character_badges
    has_many :badges, through: :character_badges

    def self.assign_new_badge(character_id, badge_id)
        @character = Character.find(character_id)
        @badge = Badge.find(badge_id)
        digits = (1..15000).to_a.sample
        email = "fake_email#{digits}@fake.com"
        issued_at = DateTime.now 

        if @character.name.split(' ').length == 1
            first_name = @character.name.split(' ')[0]
            last_name = 'Marvelous'
        else
            first_name = @character.name.split(' ')[0]
            last_name = @character.name.split(' ')[1]
        end
        
        badge_template_id = @badge.badge_id

        response_body = {
            "recipient_email": email,
            "issued_to_first_name": first_name,
            "issued_to_last_name": last_name,
            "badge_template_id": badge_template_id,
            "issued_at": issued_at,
            
          }

 
          RestClient::Request.execute(method: :post, url: "https://sandbox-api.credly.com/v1/organizations/#{$org_id}/badges", payload: response_body, headers: $credly_headers)
    
          CharacterBadge.create(badge_id: badge_id, character_id: character_id, recipient_email: email, issued_to_first_name: first_name,  issued_to_last_name: last_name, badge_template_id: badge_template_id, issued_at: issued_at )

          @character
    end
end
