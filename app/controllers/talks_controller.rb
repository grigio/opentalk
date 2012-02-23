class TalksController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :json
  # GET /talks
  # GET /talks.json
  def index
    
    if can? :manage, :all
      @talks = Talk.plusminus_tally.limit(10)
    else
      @talks = Talk.plusminus_tally.where(:status => ['visible','confirmed']).limit(10)
    end


    respond_with(@talks)
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
    # TODO: check open votes days and not self vote
    logger.info '>>>'+current_user.display_name
    
    @talk = Talk.find(params[:id])

    if @talk.user_id == current_user.id
      redirect_to :back, :notice => t('talk.no_selfvote')
      return
    end

    if @talk.voted_by? current_user
      current_user.unvote_for(@talk) #, :notice => 'voto annullato' 
    else
      current_user.vote_for(@talk) #, :notice => 'votato' 
    end

    respond_to do |format|
      #format.html { redirect_to(users_url) }
      #format.all { render :json => {:name => 'John'} }
      format.all { head :ok }
    end

    #redirect_to :back
    logger.info '>>>'+current_user.display_name
  end

end
