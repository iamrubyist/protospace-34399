class PrototypesController < ApplicationController
  before_action :set_tweet, except: [:index, :new, :create]
  before_action :move_to_index, except:[:index, :show,:new]
  def index
    @prototypes = Prototype.includes(:user)
  end
  
  def new
    @prototype = Prototype.new
  end
   
  def create

      @prototype = Prototype.new(prototype_params)
   if @prototype.save
      redirect_to root_path
   else
       render :new
    end
  end

  def edit
  end

  def update
    if prototype.update(prototype_params)
      redirect_to prototype_path, method: :patch
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments
  end

  def destroy
    if @prototype.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


private 
 def prototype_params
   params.require(:prototype).permit(:title,:catch_copy,:concept,:image).merge(user_id: current_user.id)
 end

# { ~~ , ~~ , prototype => { content => "name, text", image=> ~~~~~, aaa=> }}
def set_tweet
  @prototype = Prototype.find(params[:id])
end

def move_to_index
  #@prototype = Prototype.new(prototype_params)
  unless user_signed_in? && current_user.id == @prototype.user_id
    redirect_to action: :index
  end
end

end 