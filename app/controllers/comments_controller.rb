class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]
  before_action :set_cat, only: :create
  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        NewCommentMailer.new_comment_email(@cat.user, @cat).deliver_now unless @cat.user != @comment.user
        format.html { redirect_to cat_url(@comment.cat), notice: "Comment was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to cat_url(@comment.cat), notice: "Comment was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to cat_url(@comment.cat), status: :see_other, notice: "Comment was successfully deleted." }
    end
  end

  private

  def set_cat
    @cat = Cat.friendly.find(params[:cat_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:cat_id, :user_id, :body)
  end
end
