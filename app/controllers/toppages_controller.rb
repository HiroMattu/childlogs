class ToppagesController < ApplicationController
  def index
    if logged_in?
      @childlog = current_user.childlogs.build  # form_for 用
      @childlogs = current_user.childlogs.order('created_at DESC').page(params[:page])
    end
  end
end