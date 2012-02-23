class CommentsController < ApplicationController
  load_and_authorize_resource
  def index
    @commentable = find_commentable
    @comments = @commentable.comments
  end

  def create
    @commentable = find_commentable
    instance_variable_set("@#{@commentable.class.to_s.downcase}", @commentable)
    comment = @commentable.comments.new(params[:comment])
    comment.user_id = current_user.id
    if comment.save
      redirect_to @commentable, :notice => "Comment successfully created!"
    else
      render "#{@commentable.class.to_s.tableize}/show"
    end
  end

  private

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
