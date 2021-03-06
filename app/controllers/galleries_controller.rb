class GalleriesController < ApplicationController
  # GET /galleries
  # GET /galleries.json
  before_action :userid

  def index
    @galleries = Gallery.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @galleries }
    end
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
    @gallery  = Gallery.find(params[:id])
    @pictures = @gallery.pictures

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gallery }
    end
  end

  # GET /galleries/new
  # GET /galleries/new.json
  def new
    @user.gallery = Gallery.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gallery }
    end
  end

  # GET /galleries/1/edit
  def edit
    @gallery = Gallery.find(params[:id])
  end

  # POST /galleries
  # POST /galleries.json
  def create
    @gallery = Gallery.new(gallery_params)
    @gallery.user_id = current_user
    respond_to do |format|
      if @gallery.save

        if params[:images]
          # The magic is here ;)
          params[:images].each { |image|
            @gallery.pictures.create(image: image)
          }
        end

        format.html { redirect_to [current_user,@gallery], notice: 'Gallery was successfully created.' }
        format.json { render json: @gallery, status: :created, location: @gallery }
      else
        format.html { render action: "new" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /galleries/1
  # PUT /galleries/1.json
  def update
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      if @gallery.update_attributes(gallery_params)
        if params[:images]
          # The magic is here ;)
          params[:images].each { |image|
            @gallery.pictures.create(image: image)
          }
        end
        format.html { redirect_to [current_user,@gallery], notice: 'Gallery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to @user }
      format.json { head :no_content }
    end
  end

  private

  def userid
    @user = User.find(params[:user_id])
  end

  def gallery_params
    params.require(:gallery).permit(:description,
                                    :name,
                                    :pictures,
                                   )
  end
end
