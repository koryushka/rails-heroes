class HeroesController < ApplicationController
  before_action -> { doorkeeper_authorize! }, only: [:create, :destroy, :update]
  before_action :set_hero, only: [:show, :update, :destroy]

  # GET /heroes
  def index
    name = params[:name]
    @heroes = Hero.where('LOWER(name) LIKE ?', "%#{name.try(:downcase)}%").order(created_at: :desc)


    render json: @heroes
  end

  # GET /heroes/1
  def show
    render json: @hero
  end

  # POST /heroes
  def create
    @hero = Hero.new(hero_params)

    if @hero.save
      render json: @hero, status: :created, location: @hero
    else
      render json: @hero.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /heroes/1
  def update
    if @hero.update(hero_params)
      render json: @hero
    else
      render json: @hero.errors, status: :unprocessable_entity
    end
  end

  # DELETE /heroes/1
  def destroy
    @hero.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hero
      @hero = Hero.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hero_params
      params.require(:hero).permit(:name)
    end
end
