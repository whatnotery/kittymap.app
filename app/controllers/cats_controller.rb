class CatsController < ApplicationController
  before_action :set_cat, only: %i[ show edit update destroy ]

  # GET /cats or /cats.json
  def index
    @cats = Cat.all
  end

  # GET /cats/1 or /cats/1.json
  def show
  end

  # GET /cats/new
  def new
    @cat = Cat.new
  end

  # GET /cats/1/edit
  def edit
  end

  # POST /cats or /cats.json
  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id
      if @cat.save
        redirect_to cats_url, notice: "Cat was successfully created." 
      else
        render :new, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /cats/1 or /cats/1.json
  def update
    if @cat.update(cat_params)
      if params[:cat][:photo].present?
          cat.photo.attach(photo)
      end
    end
      redirect_to cats_url, notice: "Cat was successfully updated." 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  # DELETE /cats/1 or /cats/1.json
  def destroy
    @cat.destroy
    redirect_to cats_url, notice: "Cat was successfully destroyed." 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat
      @cat = Cat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cat_params
      params.require(:cat).permit(:alias, :photo, :description, :address ,:latitude, :longitude, :user_id)
    end
end
