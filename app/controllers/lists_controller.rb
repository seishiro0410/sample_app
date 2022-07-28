class ListsController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数にからのModelオブジェクトを生成する
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    #1&2 データを受け取り新規登録するためのインスタンス作成
    #3 データをデータベースに保存するためのsavaメソッド実行
    if @list.save
    #4 詳細画面へリダイレク
      redirect_to  list_path(@list.id)
    else
      render :new
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list = List.find(params[:id])#データ（レコード）を1件取得
    list.destroy#データ（レコードを削除
    redirect_to '/lists' #投稿一覧画面へのリダイレクト

  end

  private
  # ストロングパラメーター
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end