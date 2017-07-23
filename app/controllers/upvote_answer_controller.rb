class UpvoteAnswerController < ApplicationController
	before_action :authenticate_user!

	 def upvote_answer
		a = params[:user_id]
		bq = params[:answer_id]

		puts("\n\n\n\n\n\n\n\n\n")
		puts a,bq
		puts(params)
		puts("\n\n\n\n\n\n\n\n\n")


		@answer = Answer.find(params[:answer_id])
		upvote = UpvoteAnswer.where(user: current_user, answer: @answer).first

		if upvote
			upvote.destroy!
			is_upvoted = false;
		else
			UpvoteAnswer.create(user: current_user, answer: @answer)
			is_upvoted = true;
		end

		respond_to do |format|
			if @is_upvoted
		        format.html { redirect_to '/', notice: 'Answer Upvote' }
		        format.json { render :show, status: :created }
		    else
		        format.html { render 'home/index' }
		        format.json { render json: @question.errors, status: :unprocessable_entity }
		    end

		end

	end

end
