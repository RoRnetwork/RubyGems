class UnionsController < ApplicationController
  # GET /unions
  # GET /unions.json
  def index
    @unions = Union.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @unions }
    end
  end

  # GET /unions/1
  # GET /unions/1.json
  def show
    @union = Union.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @union }
    end
  end

  # GET /unions/new
  # GET /unions/new.json
  def new
    @union = Union.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @union }
    end
  end

  # GET /unions/1/edit
  def edit
    @union = Union.find(params[:id])
  end

  # POST /unions
  # POST /unions.json
  def create
    @union = Union.new(params[:union])

    respond_to do |format|
      if @union.save
        format.html { redirect_to @union, notice: 'Union was successfully created.' }
        format.json { render json: @union, status: :created, location: @union }
      else
        format.html { render action: "new" }
        format.json { render json: @union.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /unions/1
  # PUT /unions/1.json
  def update
    @union = Union.find(params[:id])

    respond_to do |format|
      if @union.update_attributes(params[:union])
        format.html { redirect_to @union, notice: 'Union was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @union.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unions/1
  # DELETE /unions/1.json
  def destroy
    @union = Union.find(params[:id])
    @union.destroy

    respond_to do |format|
      format.html { redirect_to unions_url }
      format.json { head :no_content }
    end
  end
end
