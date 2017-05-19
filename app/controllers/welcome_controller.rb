class WelcomeController < ApplicationController
  skip_before_action :require_login, :only => [:index]

helper_method :get_avg

def index
  @books = Book.paginate(:page => params[:page])
end

  # Sets the number of books to paginate to 2 for tesing purposes
  WillPaginate.per_page = 3

def get_avg(num)
  @get_avg = Rating.where(:book_id => num).average(:score)
end



end
