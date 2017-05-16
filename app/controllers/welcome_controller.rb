class WelcomeController < ApplicationController
  before_action :index
  skip_before_action :require_login, :only => [:index]

helper_method :get_avg
helper_method :re_rate

def index
  @books = Book.all
  @rating = Rating.new
end

def get_avg(num)
  @get_avg = Rating.where(:book_id => num).average(:score)
end

def re_rate(book)
  @rating_search = Rating.where(:book_id => book).where(:user_id => current_user.id)
  if @rating_search.present?
    true
  else
    false
  end
end



end
