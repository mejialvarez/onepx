class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to images_path, notice: t('.created', model: @image.class.model_name.human)
    else
      render :new
    end
  end

  private
    def image_params
      params.require(:image).permit(:name, :description, :category, :tags_text, :photo)
    end
end