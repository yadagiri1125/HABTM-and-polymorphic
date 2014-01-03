class ActorsController < ApplicationController
  include FilmFan::Commentable
  
  def index
    @actors = Actor.all

  end

  def show
    @actor = Actor.find(params[:id])
  end

  def new
    @actor=Actor.new

  end

  def create
    @actor = Actor.new(params[:actor])

    respond_to do |format|
      if @actor.save
        format.html { redirect_to @actor, notice: 'Post was successfully created.' }
        format.json { render json: @actor, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end


end
