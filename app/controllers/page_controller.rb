class PageController < ApplicationController

def home
    
end

def about
    
end

def new
    @articles = Article.new
    
end

def create
#render plain: params[:articles].inspect
@article = Article.new(pagecontroller_params)
end


private
def pagecontroller_params
   params.require(:articles).permit(:title,:description)
end


end
