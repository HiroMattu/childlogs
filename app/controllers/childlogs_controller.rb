class ChildlogsController < ApplicationController
  def index
    @childlogs = Childlog.all
  end

  def show
    @childlog = Childlog.find(params[:id])
  end

  def new
    @childlog = Childlog.new
  end
  
  def create
    @childlog = Childlog.new(childlog_params)
    
    if @childlog.save
      flash[:success] = '新しいことばが正常に投稿されました'
      redirect_to @childlog
    else
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
  
  private

  # Strong Parameter
  def childlog_params
    params.require(:childlog).permit(:word, :content)
  end
  
end