class AdminController < AuthenticatedController

    def show
        @user = current_user
    end

end
