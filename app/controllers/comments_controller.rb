class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_product

    def create
        @comment = @product.comments.create(comment_params)
        @comment.user = current_user

        if @comment.save
            flash[:notice] = "Comment has been created"
            redirect_to product_path(@product)
        else 
          flash[:alet] = "Comment has not been created"
          redirect_to product_path(@product)
        end  
    end 

    def destroy
        @comment = @product.comments.find(params[:id])
        @comment.destroy
        redirect_to product_path(@product)
    end 

    private

    def set_product
        @product = Product.find(params[:product_id])
    end


    def comment_params
        params.require(:comment).permit(:body)
    end 
end
