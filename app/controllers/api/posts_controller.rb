class Api::PostsController < Api::ApiController
  before_filter :authenticate_user!, only: [:show, :create, :update, :destroy, :upvote]
  load_and_authorize_resource
  def index
  render json: Post.all
  #  respond_with Post.all
  end
  def create
        post = Post.create(post_params.merge(user_id: current_user.id))
         respond_with :api, post
#    post = Post.new(post_params.merge(user_id: current_user.id))
         #  if post.save
      #render status: 200,json:{
      #           message: "Successfully created post",
      #           post: post
      #       }.to_json
    #else
    #  render status:422, json:{
    #             errors:post.errors
    #         }.to_json

  end
 #   respond_with Post.create(post_params)
  def show
    #respond_with Post.find(params[:id])
    render json: Post.find(params[:id])
  end
  def destroy
    post = Post.find(params[:id])
    post.destroy
    head :ok

  end
  def upvote
    post = Post.find(params[:id])
    post.increment!(:upvotes)
    render status: 200,json:{
                          message: "Successfully incremented post",
                          post: post
                      }.to_json
    #respond_with post
  end
  def update
    post = Post.find(params[:id])
    if (post.update(post_params))
      render status: 200,json:{
                            message: "Successfully updated post",
                            post: post
                        }.to_json
  else
    render status:422, json:{
                         errors:post.errors
                     }.to_json
  end
  end

  private
  def post_params
    params.require(:post).permit(:link,:title)
  end
end

