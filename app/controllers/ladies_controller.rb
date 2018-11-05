class LadiesController < ApplicationController
 before_action :set_list, only: [:show, :edit, :update, :destroy]
 before_action :authenticate_user!
  
  def index
    @ladies = Lady.all.where(user_id: current_user_id)
  end

  def show
  end

  def new
    @lady = Lady.new
  end
  
  def create
    @lady = Lady.new(lady_params)
    @lady.user = current_user
    
    if @lady.save
      flash[:success] = 'Lady was added successfully!'
      redirect_to action: :index
    else
      flash.now[:error] = 'Try again boss'
      render :new
    end
  end

  def edit
  end
  
  def update
    if @lady.update(lady_params)
      flash[:success] = 'Lady was updated successfully!'
      redirect_to action: :index
    else
      flash.now[:error] = 'Lady was NOT updated successfully!'
      render :edit
    end
  end
  
  def destroy
    @lady.destroy
    flash[:success] = 'Item was successfully destroyed.'
    redirect_to action: :index
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @lady = Lady.find(params[:id])
    end
    
    def current_user_id
      @curent_user_id = current_user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lady_params
      params.require(:lady).permit(:name, :face, :chest, :abs, :butt, :legs)
    end
end
