class LadiesController < ApplicationController
 before_action :set_list, only: [:show, :edit, :update, :destroy]
  
  def index
    @ladies = Lady.all
  end

  def show
  end

  def new
    @lady = Lady.new
  end
  
  def create
    @lady = Lady.new(lady_params)
    
    if @lady.save
      redirect_to action: :index, notice: 'Lady was added successfully!'
    else
      render :new, notice:'Try again boss'
    end
  end

  def edit
  end
  
  def update
    if @lady.update(lady_params)
      redirect_to action: :index, notice: 'Lady was updated successfully!'
    else
      render :edit, notice: 'Try again boss'
    end
  end
  
  def destroy
    @lady.destroy
    redirect_to action: :index,  notice: 'Item was successfully destroyed.'
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @lady = Lady.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lady_params
      params.require(:lady).permit(:name, :face, :chest, :abs, :butt, :legs)
    end
end
