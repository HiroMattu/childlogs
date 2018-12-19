class ChildlogsController < ApplicationController
  before_action :require_user_logged_in, except: [:index]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def index
    if logged_in?
      @childlog = current_user.childlogs.build  # form_for 用
      @childlogs = current_user.childlogs.order('created_at DESC').page(params[:page])
    end
  end

  def show
    @childlog = Childlog.find(params[:id])
  end

  def new
    @childlog = Childlog.new
  end
  
  def create
    @childlog = current_user.childlogs.build(childlog_params)
    
    if @childlog.save
      flash[:success] = '新しいことばが正常に投稿されました'
      redirect_to @childlog
    else
      current_user.childlogs.order('created_at DESC').page(params[:page])
      flash.now[:danger] = '新しいことばが投稿されませんでした'
      render :new
    end
  end

  def edit
    @childlog = Childlog.find(params[:id])
  end
  
  def update
    @childlog = Childlog.find(params[:id])

    if @childlog.update(childlog_params)
      flash[:success] = '正常に更新されました'
      redirect_to @childlog
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @childlog = Childlog.find(params[:id])
    @childlog.destroy

    flash[:success] = '正常に削除されました'
    redirect_to childlogs_url
  end
  
  private
  
   def set_childlog
    @Childlog = Childlog.find(params[:id])
   end
  
  def correct_user
    @childlog = current_user.childlogs.find_by(id: params[:id])
    unless @childlog
      redirect_to root_url
    end
  end

  # Strong Parameter
  def childlog_params
    params.require(:childlog).permit(:word, :content, :childwordtiming, :child_id)
  end
  
end