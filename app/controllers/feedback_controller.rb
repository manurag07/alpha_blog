class FeedbackController < ApplicationController
  before_action :require_user, except: %w[search_username display_username]

  def new
    @feedback = Feedback.new
  end

  def create
    feedback = Feedback.new(feedback_params)
    if feedback.save
      flash[:success] = 'Thanks for the feedback. We are working to make this better day by day'
      redirect_to root_path
    else
      flash.now[:error] = 'Something went wrong please try again'
      render 'new'
    end
  end

  def search_username; end

  def display_username
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      flash[:success] = "Your username is #{user.username}"
      redirect_to root_path
    else
      flash[:error] = 'There is something wrong with your email or password'
      redirect_to root_path
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :description, :user_id)
  end
end
