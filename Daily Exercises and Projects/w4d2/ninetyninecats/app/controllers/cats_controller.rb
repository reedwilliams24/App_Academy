class CatsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @cat = Cat.new(birth_date: nil, color: nil, name: nil, sex: nil, description: nil)
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to @cat
    else
      render :new
    end
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to @cat
    else
      render :edit
    end
  end

  def edit
    @cat = Cat.find_by_id(params[:id])
  end

  def destroy
    @cat = Cat.find_by_id(params[:id])
    @cat.destroy
    redirect_to cats_url
  end

  protected
  def cat_params
    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
  end

end
