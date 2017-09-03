class CommentsController < ApplicationController
	def new
		@company = Company.find(params[:company_id])
		@job = Job.find(params[:job_id])
		@comment = Comment.new
	end

	def create
		@company = Company.find(params[:company_id])
    @job = Job.find(params[:job_id])
		@comment = @job.comments.new(comment_parmas)
		if @comment.save
			flash[:success] = "You created a comment for #{@company.name} with the job title: #{@job.title}"
			redirect_to company_job_path(@company, @job)
		else
			render :new
		end
	end

	private

	def comment_parmas
		params.require(:comment).permit(:content)
	end
end
