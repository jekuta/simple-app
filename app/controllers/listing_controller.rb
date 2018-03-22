class ListingController < ApplicationController
  def index
    render :index, locals: {users: User.all}
  end
end
