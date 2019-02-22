class SeasController < ApplicationController
  #define your controller actions here

  def index
    @seas = Sea.all
  end

  def show
    @sea = Sea.find(params[:id])
    #code
  end

  def edit
    @sea = Sea.find(params[:id])
    #code
  end

  def destroy
    @sea = Sea.find(params[:id])
    @sea.delete
    redirect_to '/seas'
    #code
  end

  def new
    #code
  end

  def create
    @sea = Sea.create(params)
    redirect_to "/seas/#{@sea.id}"
  end

  def update
    #byebug

    @sea = Sea.find(params[:id])
    sea_params[:has_mermaids] ||= false
    @sea.update(sea_params)
    redirect_to "/seas/#{@sea.id}"
    # redirect_to controller: 'seas', action: 'show'
  end


  private
  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!
  def sea_params
      params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end

end
