class SearchsController < ApplicationController
  def search
    @query = params[:query]
    attribute = params[:attribute]
    search_method = params[:search_method]
    if @query.present?
      if attribute == "name"
        @model_name = "User"
        @users = User.search(search_method, @query)
      elsif attribute == "title"
        @model_name = "Book"
        @books = Book.search(search_method, @query)
      end
    else
      redirect_back(fallback_location: user_path(current_user.id))
    end
  end
  
  private

  def serch_params
    params.permit(:query, :attribute, :search_method)
  end
  
  
end