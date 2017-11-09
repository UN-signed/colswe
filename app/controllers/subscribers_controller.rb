class SubscribersController < ApplicationController
  before_action :set_subscriber, only: [:show, :edit, :update, :destroy]

  # GET /subscribers
  # GET /subscribers.json

  def index
    @subscribers = Subscriber.all
  end

  # GET /subscribers/1
  # GET /subscribers/1.json
  def show
  end

  # GET /subscribers/new
  def new
    @subscriber = Subscriber.new
  end

  # GET /subscribers/1/edit
  def edit
  end

  # POST /subscribers
  # POST /subscribers.json
  def create
    @subscriber = Subscriber.new(subscriber_params)

    respond_to do |format|
      if @subscriber.save
        format.html { redirect_to @subscriber, notice: 'Subscriber was successfully created.' }
        format.json { render :show, status: :created, location: @subscriber }
      else
        format.html { render :new }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscribers/1
  # PATCH/PUT /subscribers/1.json
  def update
    respond_to do |format|
      if @subscriber.update(subscriber_params)
        format.html { redirect_to @subscriber, notice: 'Subscriber was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscriber }
      else
        format.html { render :edit }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscribers/1
  # DELETE /subscribers/1.json
  def destroy
    @subscriber.destroy
    respond_to do |format|
      format.html { redirect_to subscribers_url, notice: 'Subscriber was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_subscriber
    @project = Project.find(params[:id])
    @user = User.find(current_user.id)
    @subscriber = Subscriber.create(:name => @user.name, :email => @user.email, :project_id => params[:id], :user_id => current_user.id)
    NewSubscriberMailer.welcome_email(@user, @project).deliver_now
    WeeklyReportSubscriberJob.set(wait_until: Time.now + 7.days).perform_later(@subscriber)
    redirect_to project_path(@project)
  end

  def delete_subscriber
    @project = Project.find(params[:id])
    @user = User.find(current_user.id)
    @subscriber = Subscriber.where(:name => @user.name, :email => @user.email, :project_id => params[:id], :user_id => current_user.id)
    Subscriber.destroy(@subscriber[0].id)
    redirect_to project_path(@project)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscriber
      @subscriber = Subscriber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscriber_params
      params.require(:subscriber).permit(:name, :email, :project_id, :member_id)
    end
end
