class ListingController < ApplicationController
  def index
    render :index, locals: { posts: Post.page(params[:page]) }
  end
end
