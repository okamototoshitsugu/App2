class PostImagesController < ApplicationController

	def destroy
		@post_imge = PostlImage.find(params[:id])
		@post_imge.destroy
		redirect_to post_images_path
	end

	def new
		@post_image = PostlImage.new
	end

	def create
		@post_image =PostlImage.new(post_image_params)
		@post_image.user_id = current_user.id
		@image.seve
		redirect_to post_images_path
	end
	private
	def post_image_params
		params.require(:post_image).permit(:imgae)



end
