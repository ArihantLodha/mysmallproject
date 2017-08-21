class ArihantsController < ApplicationController
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
   flash[:notice] = "Records was successfully created."
   redirect_to arihant_path(@arihant)
  else
    render 'new'
  end
 end
  
  def show
    @arihant = Arihant.find(params[:id])
  end 
  
  def destroy
   @arihant = Arihant.find(params[:id])
  @arihant.destroy
   flash[:notice] = "Records was successfully deleted."
  redirect_to arihants_path(@arihant)
  end
  
  def edit
    @arihant = Arihant.find(params[:id])
  end
  
  def update
   @arihant = Arihant.find(params[:id])
   if @arihant.update(arihant_params)
    flash[:notice] = "Records was successfully updated."
    redirect_to arihant_path(@arihant)
   else
    render 'edit'
   end
  end
  
  private
  def arihant_params
  params.require(:arihant).permit(:Name,:Division,:Created)
  end
  
end