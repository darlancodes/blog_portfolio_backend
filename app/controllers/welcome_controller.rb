class WelcomeController < ApplicationController
  def index
    @posts = Post.all.limit(3).order("created_at desc")
    #limita a 3 posts com a ordem em data de criação
  end
end
