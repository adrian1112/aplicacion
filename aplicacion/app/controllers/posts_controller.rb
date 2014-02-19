class PostsController < ApplicationController
	def new
		@post = Post.new
	end
	
	def create
	  @post = Post.new(params.require(:post).permit(:title, :text))
 	  if @post.save
	    redirect_to @post
	  else
	    render 'new'
	  end
	end
	def edit
	  @post = Post.find(params[:id])
	end
	def update
	  @post = Post.find(params[:id])
	 
	  if @post.update(params[:post].permit(:title, :text))
	    redirect_to @post
	  else
	    render 'edit'
	  end
	end
	
	def show
	  @post = Post.find(params[:id])
	end
	def index
	  @posts = Post.all
	end
	def destroy
	  @post = Post.find(params[:id])
	  @post.destroy
	 
	  redirect_to @post
	end
	


end
