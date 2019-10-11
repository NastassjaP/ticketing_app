class CategoriesController < AuthenticatedController


    def index
        @categories = Category.all
        authorize @categories

    end

    def new
        @category = Category.new
        authorize @category
    end
    
    def create
      @category = Category.new(category_params)
      authorize @category
      if @category.save
        redirect_to categories_path
      else
        redirect_to new_category_path
      end
    end

      def show
        @category = Category.find(params[:id])
        authorize @category
        @upcoming_events = @category.events.upcoming_events.order(date: :asc)
        @past_events = @category.events.past_events.order(date: :asc)
      end

    private
    def category_params
        params.require(:category).permit(:name)
    end
end
