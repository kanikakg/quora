class UpvoteQuestionController < ApplicationController
	before_action :authenticate_user!
	# def upvote_question
	# 	@tweet = Tweet.find(params[:tweet_id])
	# 	upvote = Upvote.where(user: current_user, tweet: @tweet).first
	# 	if like
	# 		like.destroy!
	# 		@is_liked = false	
	# 	else
	# 		Like.create(user: current_user, tweet: @tweet)
	# 		@is_liked = true
	# 	end

	# 	respond_to do |format|
	# 		format.js {}
	# 	end
		
	# end

	def upvote_question
		a = params[:question_id]
		bq = params[:user_id]
		puts("\n\n\n\n\n\n\n\n\n")
		puts a,bq
		puts(params)
		puts("\n\n\n\n\n\n\n\n\n")
		@question = Question.find(params[:question_id])
		upvote = UpvoteQuestion.where(user: current_user, question: @question).first

		if upvote
			upvote.destroy!
			@is_upvoted = false	
		else
			UpvoteQuestion.create(user: current_user, question: @question)
			
			@is_upvoted = true
		end

		respond_to do |format|
			if @is_upvoted
		        format.html { redirect_to '/', notice: 'Upvote was successfully created.' }
		        format.json { render :show, status: :created }
		    else
		        format.html { render 'home/index' }
		        format.json { render json: @question.errors, status: :unprocessable_entity }
		    end
		end
		
	end

end
