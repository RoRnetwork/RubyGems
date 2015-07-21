class UnionsController < ApplicationController
  before_filter :set_union, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @unions = Union.all
    respond_with(@unions)
  end

  def show
    respond_with(@union)
  end

  def new
    @union = Union.new
    respond_with(@union)
  end

  def edit
  end

  def create
    @union = Union.new(params[:union])
    @union.save
    respond_with(@union)
  end

  def update
    @union.update_attributes(params[:union])
    respond_with(@union)
  end

  def destroy
    @union.destroy
    respond_with(@union)
  end

  private
    def set_union
      @union = Union.find(params[:id])
    end
end
