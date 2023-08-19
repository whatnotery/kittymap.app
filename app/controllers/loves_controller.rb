class LovesController < ApplicationController
    before_action :find_cat
    before_action :require_user!
    before_action :find_love, only: [:destroy]

    def create
        if already_loved?
            nil
          else
            @love = @cat.loves.create(user_id: current_user.id)
            if @love.save
              NewLoveMailer.new_love_email(@cat.user, @cat, current_user).deliver_now
              redirect_back(fallback_location: root_path)
            end
          end
  
    end

    def destroy
        if !(already_loved?)
          nil
        else
          @love.destroy
        end 
        redirect_back(fallback_location: root_path)
      end

    private

    def already_loved?
        Love.where(user_id: current_user.id, cat_id:
        params[:cat_id]).exists?
      end

    def find_cat
        @cat = Cat.find(params[:cat_id])
    end

    def find_love
        @love = @cat.loves.find(params[:id])
     end

end

