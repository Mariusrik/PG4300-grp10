class WelcomeController < ApplicationController
  skip_before_action :require_login, :only => [:index]

helper_method :get_avg
helper_method :re_rate
helper_method :give_rating

def index
  @books = Book.paginate(:page => params[:page])
  @ratings = Rating.all
  @rating = Rating.new
end
  # Sets the number of books to paginate to 2 for tesing purposes
  WillPaginate.per_page = 2


def get_avg(num)
  @get_avg = Rating.where(:book_id => num).average(:score)
end

  #TODO: need to fix these

def re_rate(book)
  @has_rating = Rating.where(:book_id => book).where(:user_id => current_user.id).any?
end

def give_rating(book)
  @give_rating = Rating.where(:book_id => book).where(:user_id => current_user.id).pluck(:id)
end



end
