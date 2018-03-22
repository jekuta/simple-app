class ListingController < ApplicationController
  def index
    render :index, locals: { posts: Post.limit(2) }
  end
end
