# encoding: utf-8

class PeopleController < ApplicationController

  before_filter :authenticate_user!
  before_filter do
    if current_user
      check_admin_or_own
      set_current_user_id
    else
      flash.keep
      redirect_to :new_user_session
    end
  end

  def check_admin_or_own
    #render :text =>  current_user.id.to_s
    redirect_to_default unless current_user.isAdmin? || current_user.id.to_s == params[:user_id]
  end

  def redirect_to_default
    redirect_to user_people_path(current_user.id)
  end

  # GET /people
  # GET /people.json
  # GET /people.xml
  def index
    @people = Person.where(:user_id => @current_user.id).all

    if @people
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @people }
        format.xml  { render xml: @people }
      end
    end
  end

  # GET /people/1
  # GET /people/1.json
  # GET /people/1.xml
  def show
    @person = Person.find_by_id(params[:id])

    if @person && @person.user_id == current_user.id
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @person }
        format.xml  { render xml: @person }
      end
    else
      redirect_to_default
    end
  end

  # GET /people/new
  # GET /people/new.json
  # GET /people/new.xml
  def new
    #render :text => params.inspect
    @person = Person.new(:user_id => params[:user_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @person }
      format.xml  { render xml: @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
    redirect_to_default unless @person && @person.user_id == current_user.id
  end

  # POST /people
  # POST /people.json
  # POST /people.xml
  def create
    #render :text => params.inspect
    unless Person.where(:user_id => params[:person][:user_id],
                        :last_name => params[:person][:last_name],
                        :first_name => params[:person][:first_name],
                        #:geburtsdatum => params[:person][:geburtsdatum]
                        ).empty?
      flash[:error] = t(:contact_already_exists)
      redirect_to(:back)
      #format.html { render action: :new }
    else
      @person = Person.new(params[:person])
      respond_to do |format|
        if @person.user == current_user && @person.save
          format.html { redirect_to user_person_path(:user_id => params[:user_id], :id => @person.id), notice: t('person_successfully_created') }
          format.json { render json: @person, status: :created, location: @person }
          format.xml  { render xml:  @person, status: :created, location: @person }
        else
          format.html { render action: :new }
          format.json { render json: @person.errors, status: :unprocessable_entity }
          format.xml  { render xml: @person.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.json
  # PUT /people/1.xml
  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.user == current_user && @person.update_attributes(params[:person])
        format.html { redirect_to user_person_path(:user_id => @person.user_id, :id => @person.id), notice: t('person_successfully_updated')}
        format.json { head :no_content }
        format.xml  { render xml: :ok }
      else
        format.html { render action: :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
        format.xml  { render xml: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  # DELETE /people/1.xml
  def destroy
    @person = Person.find_by_id(params[:id])
    redirect_to_default unless @person && @person.user == current_user
    @person.destroy if @person

    respond_to do |format|
      format.html { redirect_to user_people_url }
      format.json { head :no_content }
      format.xml  { render xml: :ok }
    end
  end
end
