class ChildrenController < ApplicationController

  def index
    if logged_in?
      @child = current_user.children.build  # form_for 用
      @children = current_user.children.order('created_at DESC').page(params[:page])
    end
  end

  def show
    @child = Child.find(params[:id])
  end

  def new
    @child = Child.new
  end

  def create
    @child = current_user.children.build(child_params)

    if @child.save
      flash[:success] = 'こども情報を登録しました。'
      redirect_to @child
    else
      current_user.children.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'こども情報の登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @child = Child.find(params[:id])
  end
  
  def update
    @child = Child.find(params[:id])

    if @child.update(child_params)
      flash[:success] = '正常に更新されました'
      redirect_to @child
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @child = Child.find(params[:id])
    @child.destroy

    flash[:success] = '正常に削除されました'
    redirect_to children_url
  end  

  private
  
   def set_child
    @Child = Child.find(params[:id])
   end
  
  def correct_user
    @child = current_user.child.find_by(id: params[:id])
    unless @child
      redirect_to root_url
    end
  end

  # Strong Parameter
  def child_params
    params.require(:child).permit(:childname, :childbirthday)
  end
  
end