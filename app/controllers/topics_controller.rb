class TopicsController < ApplicationController

  def index
    @topics = Topic.all
    @topic = Topic.new
    @user = User.find_by(session[:user_id])
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      redirect_to @topic
    else
      render 'index'
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic=Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to @topic
    else
      render 'edit'
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path
  end

  private
    def topic_params
      params.require(:topic).permit(:title, :body)
    end
end
