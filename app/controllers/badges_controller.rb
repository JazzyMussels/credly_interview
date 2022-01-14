class BadgesController < ApplicationController

    def index 
        @badges = Badge.all
    end

    def new 
        @badge = Badge.new 
    end

    def create 
        @badge = Badge.new(badge_params)

        if @badge.save
            redirect_to badge_path(@badge)
        else
            render :new 
        end
    end

    def show 
        @badge = Badge.find(params[:id])
    end

    private 

    def badge_params 
        params.require(:badge).permit(:badge_id, :name, :image_url, :issuer, :skill)
    end
end

