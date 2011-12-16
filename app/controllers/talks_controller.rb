class TalksController < ApplicationController
  # GET /talks
  # GET /talks.json
  def index
    @talks = Talk.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @talks }
    end
  end

  # GET /talks/1
  # GET /talks/1.json
  def show
    @talk = Talk.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @talk }
    end
  end

  # GET /talks/new
  # GET /talks/new.json
  def new
    @talk = Talk.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @talk }
    end
  end

  # GET /talks/1/edit
  def edit
    @talk = Talk.find(params[:id])
  end

  # POST /talks
  # POST /talks.json
  def create
    @talk = Talk.new(params[:talk])
    @talk.user_id = current_user.id
    
    respond_to do |format|
      if @talk.save
        format.html { redirect_to @talk, :notice => 'Talk was successfully created.' }
        format.json { render :json => @talk, :status => :created, :location => @talk }
      else
        format.html { render :action => "new" }
        format.json { render :json => @talk.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /talks/1
  # PUT /talks/1.json
  def update
    @talk = Talk.find(params[:id])

    respond_to do |format|
      if @talk.update_attributes(params[:talk])
        format.html { redirect_to @talk, :notice => 'Talk was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @talk.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /talks/1
  # DELETE /talks/1.json
  def destroy
    @talk = Talk.find(params[:id])
    @talk.destroy

    respond_to do |format|
      format.html { redirect_to talks_url }
      format.json { head :ok }
    end
  end

  # POST
  def toggle_vote
    # TODO: check open votes days
    logger.info '>>>'+current_user.display_name
    @talk = Talk.find(params[:id])
    if @talk.voted_by? current_user
      current_user.clear_votes(@talk) #, :notice => 'voto annullato' 
    else
      current_user.vote_for(@talk) #, :notice => 'votato' 
    end
    redirect_to :back
    logger.info '>>>'+current_user.display_name
  end

end
