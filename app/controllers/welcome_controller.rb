class WelcomeController < ApplicationController
  skip_before_action :require_login, :only => [:index]


def index
  @books = Book.paginate(:page => params[:page])
end

  # Sets the number of books to paginate to 2 for tesing purposes
  WillPaginate.per_page = 3

end
