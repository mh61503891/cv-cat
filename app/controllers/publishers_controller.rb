class PublishersController < ApplicationController

  before_action :set_publisher, only: [:show, :edit, :update, :destroy]

  # GET /publishers
  def index
    @publishers = Publisher.all.decorate
  end

  # GET /publishers/1
  def show
  end

  # GET /publishers/new
  def new
    @publisher = Publisher.new.decorate
  end

  # GET /publishers/1/edit
  def edit
  end

  # POST /publishers
  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      redirect_to @publisher, notice: "Publisher was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /publishers/1
  def update
    if @publisher.update(publisher_params)
      redirect_to @publisher, notice: "Publisher was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /publishers/1
  def destroy
    @publisher.destroy
    redirect_to publishers_url, notice: "Publisher was successfully destroyed."
  end

  private

  def set_publisher
    @publisher = Publisher.find(params[:id]).decorate
  end

  def publisher_params
    params.require(:publisher).permit(
      :url,
      names_attributes: [:id, :locale, :value],
      abbreviations_attributes: [:id, :locale, :value]
    ).tap { |it|
      it.compact_blank!
      it[:names_attributes]&.reject! { |key, value|
        value[:id].blank? && value[:value].blank?
      }
      it[:abbreviations_attributes]&.reject! { |key, value|
        value[:id].blank? && value[:value].blank?
      }
    }
  end

end
