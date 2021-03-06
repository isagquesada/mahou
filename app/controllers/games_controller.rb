class GamesController < ApplicationController
  # GET /games
  def index
    @games = Game.all(:conditions => {:played => false})

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /games/played
  def played
    @games = Game.all(:conditions => {:played => true})

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /games/1
  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /games/new
  def new
    @game = Game.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  def create
    @game = Game.new(params[:game])

    respond_to do |format|
      if @game.save
        flash[:notice] = 'Game was successfully created.'
        format.html { redirect_to path_after_success }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /games/1
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        flash[:notice] = 'Game was successfully updated.'
        format.html { redirect_to path_after_success }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /games/1
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to path_after_success }
    end
  end

  # GET /games/1/select_players
  def select_players
    @game = Game.find(params[:id])
    @players = Player.all(:order => :name)
  end

  # GET /games/1/select_trophies
  def select_trophies
    @game = Game.find(params[:id])
    @trophies = Trophy.all(:order => :title)
  end

  private

  def path_after_success
    games_url
  end

end
