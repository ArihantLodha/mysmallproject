class ArihantsController < ApplicationController
 before_action :set_article, only: [:edit,:update,:show,:destroy]
 
 def new
     @arihant = Arihant.new
 end
 
 def index
  @allrecords = Arihant.all
 end
 
 def create
  @arihant = Arihant.new(arihant_params)
 # render plain:params[:arihant].inspect
  if @arihant.save
   flash[:success] = "Records was successfully created."
   redirect_to arihant_path(@arihant)
  else
    render 'new'
  end
 end
  
  def show
  end 
  
  def destroy
  @arihant.destroy
   flash[:danger] = "Records was successfully deleted."
  redirect_to arihants_path(@arihant)
  end
  
  def edit
  end
  
  def update
   if @arihant.update(arihant_params)
    flash[:success] = "Records was successfully updated."
    redirect_to arihant_path(@arihant)
   else
    render 'edit'
   end
  end
  
  private
  def arihant_params
  params.require(:arihant).permit(:Name,:Division,:Created)
  end
  
  def set_article
   @arihant = Arihant.find(params[:id])
  end
  
end