class CatsController < ApplicationController
  before_action :set_cat, only: %i[show edit update destroy]

  # GET /cats or /cats.json
  def index
    @cats = Cat.all.ordered_by_love
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
    @cat = Cat.new(cat_params.except(:address))
    @cat.user_id = current_user.id
    @cat.slug = cat_params[:name].parameterize
    if @cat.save
      NewCatMailer.new_cat_email(@cat).deliver_now
      redirect_to cat_url(@cat), notice: "#{@cat.name} was successfully added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cats/1 or /cats/1.json
  def update
    if @cat.update(cat_params.except(:address))
      redirect_to cat_url(@cat), notice: "#{@cat.name} was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /cats/1 or /cats/1.json
  def destroy
    @cat.destroy
    redirect_to cats_url, notice: "Cat was successfully removed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cat
    @cat = Cat.friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cat_params
    params.require(:cat).permit(:name, :description, :photo, :latitude, :longitude, :user_id).compact_blank
  end
end
