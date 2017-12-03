class UsersController < Clearance::UsersController

  def create
    user = User.new(user_params)
    if user.save
      redirect_to root_path
    else
      redirect_to sign_up_path
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update

      @user = User.find(current_user.id)
      if @user.update_attributes(user_params) 
        flash[:success] = "You changed your user information!"
        redirect_to root_path
      else  
        render 'edit'
      end
  end

  def show
  end

  def destroy
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :avatar) 
  end

end
                    