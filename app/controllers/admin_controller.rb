class AdminController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :current_admin, except: [:sign_in, :login]

  def administrator
    @post=Post.uncensored.order(:created_at => :desc)
    @post_censored=Post.joins(:user).censored.order(:created_at => :desc)
  end

  def current_admin
    @current_admin ||=Admin.find_by_user session[:admin_user]
    unless @current_admin
      redirect_to admin_sign_in_path
    end
  end

  def sign_in
    @current_admin ||=Admin.find_by_user session[:admin_user]
    if @current_admin
      redirect_to admin_administrator_path
    end
  end

  def login
        admin = Admin.find_by_user(params[:user])
        if admin.pass.eql? params[:pass]
          flash[:success] = "Đăng nhập thành công"
          redirect_to admin_administrator_path
          session[:admin_user] = admin.user
        else 
          flash[:success] = "Đăng nhập thất bại"
        end
  end

  def sign_out
      @current_admin = session[:admin_user] = nil
      redirect_to admin_sign_in_path
  end

  def register
      
  end
end
