require 'rest-client'
require 'json'
require 'base64'
require 'digest/md5'


public_key = '1c829e435b4e86561621f2a7a7259e9e'

hash = Digest::MD5.hexdigest("1#{ENV['MARVEL_PRIVATE_KEY']}#{public_key}")

i = 1011250

while i < 1011300
   
    RestClient.get("https://gateway.marvel.com/v1/public/characters/#{i.to_s}?ts=1&apikey=#{public_key}&hash=#{hash}") { |response, request, result, &block|
        case response.code
        when 200
            character = JSON.parse(response)['data']['results'][0]
  
            name = character['name']
            if character['description'] == ''
                description = Faker::Hipster.sentences(number: 1)[0]
            else 
                description = character['description'] 
            end
        
            if character['thumbnail']['path'].split('/')[-1] == 'image_not_available' || character['thumbnail']['path'] == ''
                image = Faker::Fillmurray.image
            else
                image = "#{character['thumbnail']['path']}.#{character['thumbnail']['extension']}"
            end
        
            Character.create(name: name, description: description, image: image)
        else
          next
        end
      }
i+= 1
end

auth = Base64.strict_encode64(ENV['CREDLY_AUTH'])

credly_headers = {
    :Accept => "application/json",
    :Authorization => "Basic #{auth}",
    "Content-Type" => "application/json"
}



response = RestClient.get("https://sandbox-api.credly.com/v1/organizations/#{ENV['CREDLY_ORG_ID']}/badge_templates", credly_headers)

badges = JSON.parse(response)['data']

badges.each do |badge| 
    Badge.create(badge_id: badge['id'], name: badge['name'], image_url: badge['image_url'], issuer: badge['owner']['name'], skill: badge['skills'][0])
    end



