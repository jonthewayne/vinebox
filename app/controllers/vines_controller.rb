class VinesController < ApplicationController
  
  
  def proxy
    #default to video of Judd dancing
    @vinevideo = "https://vines.s3.amazonaws.com/videos/2013/04/06/B15F7BDE-74A4-4D43-B81A-8E2AF2A5B1AC-305-000000935BA4A4CB_1.0.7.mp4?versionId=bCRp4zWMDa_VqxSl3ykWa0c5oERUxRih"
    
    if params[:vineid]
      @vinevideo = Vine.proxy(params[:vineid])
    end
    
    #logger.debug params[:vinedata]
    render :json => params[:vinedata]
  end
  
  # GET /vines
  # GET /vines.json
  def index
    @vines = Vine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vines }
    end
  end

  # GET /vines/1
  # GET /vines/1.json
  def show
    @vine = Vine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vine }
    end
  end

  # GET /vines/new
  # GET /vines/new.json
  def new
    @vine = Vine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vine }
    end
  end

  # GET /vines/1/edit
  def edit
    @vine = Vine.find(params[:id])
  end

  # POST /vines
  # POST /vines.json
  def create
    @vine = Vine.new(params[:vine])

    respond_to do |format|
      if @vine.save
        format.html { redirect_to @vine, notice: 'Vine was successfully created.' }
        format.json { render json: @vine, status: :created, location: @vine }
      else
        format.html { render action: "new" }
        format.json { render json: @vine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vines/1
  # PUT /vines/1.json
  def update
    @vine = Vine.find(params[:id])

    respond_to do |format|
      if @vine.update_attributes(params[:vine])
        format.html { redirect_to @vine, notice: 'Vine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vines/1
  # DELETE /vines/1.json
  def destroy
    @vine = Vine.find(params[:id])
    @vine.destroy

    respond_to do |format|
      format.html { redirect_to vines_url }
      format.json { head :no_content }
    end
  end
end
