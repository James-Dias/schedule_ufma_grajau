class UsersController < ApplicationController
  before_action :authorize_user
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :allow_without_password, only: [:update]
  rescue_from ActiveRecord::RecordNotFound, with: :user_not_authorized

  # GET /users
  # GET /users.json
  def index
    @users = UserDecorator.decorate_collection(policy_scope(User).order(:created_at).page params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def authorize_user
    authorize User
  end

  private
    def allow_without_password
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
          params[:user].delete(:password)
          params[:user].delete(:password_confirmation)
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = UserDecorator.decorate(policy_scope(User).find(params[:id]))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :cpf, :rg, :registration, :address, :phone1, :phone2, :kind, :course, :description)
    end
end
