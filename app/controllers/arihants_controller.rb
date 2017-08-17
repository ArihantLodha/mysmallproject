class ArihantsController < ApplicationController
 def new
     @arihant = Arihant.new
 end
 
 def create
  @arihant = Arihant.new(arihant_params)
 # render plain:params[:arihant].inspect
  if @arihant.save
   flash[:notice] = "Arihant was successfully created."
   redirect_to arihants_path(@arihant)
  else
    render 'new'
  end
 end
  
  def show
    @arihant = Arihant.find(params[:id])
  end
  
  
  private
  def arihant_params
  params.require(:arihant).permit(:Name,:Division,:Created)
  end
  
end