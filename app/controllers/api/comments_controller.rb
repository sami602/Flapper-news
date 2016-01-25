class Api::CommentsController < Api::ApiController
  before_filter :authenticate_user!
  before_filter :find_post
  load_and_authorize_resource
  def create
    comment = @post.comments.new(comment_params.merge(user_id: current_user.id))
    if comment.save
      render status: 200,json:{

                            message: "Successfully created comment",
                            post: @post,
                            comment: comment
                        }.to_json
    else
      render status:422, json:{
                           errors:comment.errors
                       }.to_json
    end
    #comment = @post.comments.create(comment_params)
    #respond_with @post, comment
  end
  def update
    comment = @post.comments.find(params[:id])
    if comment.update(comment_params)
      render status: 200, json: {
                            message: "Successfully updated comment.",
                            post: @post,
                            comment: comment
                        }.to_json
    else
      render status: 422, json: {
                            message: "Comment update failed.",
                            errors: comment.errors
                        }.to_json
    end
  end

  def destroy
    comment = @post.comments.find(params[:id])
    comment.destroy
    render status: 200, json: {
                          message: "Comment successfully deleted.",
                          post: @post,
                          comment: comment
                      }.to_json
  end

  def upvote

    comment = @post.comments.find(params[:id])
    comment.increment!(:upvotes)
    render status: 200,json:{

                          message: "Successfully updated comment",
                          post: @post,
                          comment: comment
                      }.to_json
    #respond_with @post,comment
  end
  private
  def comment_params
    params.require(:comment).permit(:body)
  end
  def find_post
    @post = Post.find(params[:post_id])
  end
end
