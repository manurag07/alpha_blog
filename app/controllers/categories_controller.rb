# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :should_admin, except: %i[index show edit update destroy]
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category created successfully'
      redirect_to @category
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = 'Category updated successfully'
      redirect_to @category
    else
      flash.now[:alert] = 'Something went wrong please try again later'
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.paginate(page: params[:page], per_page: 5)
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:success] = 'Category deleted successfully'
      redirect_to categories_path
    else
      flash.now[:alert] = 'Something went wrong please try again later'
      redirect_to @category
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def should_admin
    unless logged_in? && current_user.admin?
      flash[:alert] = 'Only admin can create category'
      redirect_to categories_path
    end
  end
end
