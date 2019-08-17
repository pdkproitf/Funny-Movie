class SharesController < ApplicationController
  before_action :set_share, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @shares = Share.all
  end

  def show
  end

  def new
    @share = Share.new
  end

  def create
    @share = current_user.shares.create(share_params)

    respond_to do |format|
      if @share.save
        format.html { redirect_to @share, notice: 'Share was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @share.update(share_params)
        format.html { redirect_to @share, notice: 'Share was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @share.destroy
    respond_to do |format|
      format.html { redirect_to shares_url, notice: 'Share was successfully destroyed.' }
    end
  end

  private
    def set_share
      @share ||= current_user.shares.find(params[:id])
    end

    def share_params
      params.require(:share).permit(:title, :description, :url)
    end
end
