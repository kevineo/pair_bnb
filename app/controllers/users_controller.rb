class UsersController < ApplicationController
  # before_action :require_login

def index
	@users = User.all
end

def show
  @user = User.find(params[:id])
end

def new
   @user = User.new
end

def edit
	@user = current_user
end

def create
@user = User.new(user_params)
respond_to do |format|
if @user.save
	format.html { redirect_to user_path(@user.id), notice: 'User was successfully created.' }
	      else
	        format.html { render :new }
	   end
	end
end

def update
	@user = User.find(params[:id])
	    respond_to do |format|
	      if @user.update(user_params)
	        format.html { redirect_to @user, notice: 'User was successfully updated.' }
	      else
	        format.html { render :edit }
	    end
	end
end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
          params.require(:user).permit(:first_name, :email, :password, :encrypted_password, :avatar)
    end

    def user_avatar
    end

end
