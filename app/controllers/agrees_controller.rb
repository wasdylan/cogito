class AgreesController < ApplicationController
  # GET /agrees
  # GET /agrees.json
  def index
    @agrees = Agree.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @agrees }
    end
  end

  # GET /agrees/1
  # GET /agrees/1.json
  def show
    @agree = Agree.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @agree }
    end
  end

  # GET /agrees/new
  # GET /agrees/new.json
  def new
    @agree = Agree.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @agree }
    end
  end

  # GET /agrees/1/edit
  def edit
    @agree = Agree.find(params[:id])
  end

  # POST /agrees
  # POST /agrees.json
  def create
    @agree = Agree.new(params[:agree])

    respond_to do |format|
      if @agree.save
        format.html { redirect_to @agree, notice: 'Agree was successfully created.' }
        format.json { render json: @agree, status: :created, location: @agree }
      else
        format.html { render action: "new" }
        format.json { render json: @agree.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /agrees/1
  # PUT /agrees/1.json
  def update
    @agree = Agree.find(params[:id])

    respond_to do |format|
      if @agree.update_attributes(params[:agree])
        format.html { redirect_to @agree, notice: 'Agree was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @agree.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agrees/1
  # DELETE /agrees/1.json
  def destroy
    @agree = Agree.find(params[:id])
    @agree.destroy

    respond_to do |format|
      format.html { redirect_to agrees_url }
      format.json { head :no_content }
    end
  end
end
