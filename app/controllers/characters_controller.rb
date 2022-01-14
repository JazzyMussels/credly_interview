class CharactersController < ApplicationController

    def index 
        @characters = Character.all
    end

    def new 
        @character = Character.new 
    end

    def create 
        @character = Character.new(character_params)

        if @character.save
            redirect_to character_path(@character)
        else
            render :new 
        end
    end

    def show 
        @character = Character.find(params[:id])
    end

    def add_badge_to_character 
        redirect_to character_path(Character.assign_new_badge(params[:id], params[:badge_id]))
    end

    private 

    def character_params 
        params.require(:character).permit(:name, :image, :description)
    end
end
