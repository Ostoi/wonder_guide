class UsersController < ApplicationController
      def show
        unless current_user
          redirect_to root_path
        end
        @bookings = current_user.bookings
        @citytours = current_user.citytours
      end

      def edit
        @user = User.find(params[:user_id])
      end

      def update
            return redirect_to '/users' unless session[:id]

            @user = User.find(params[:id])
            if @user.update(update_params)
              redirect_to sights_path
            else
              flash[:errors] = @user.errors.full_messages
              redirect_to "/users/#{@user.id}/edit"
            end
      end

      def create
        @user = User.create!
            if @user.guide?
              Guide.create!(user: @user)
            end
      end

    private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :photo, :guide)
      end

end
