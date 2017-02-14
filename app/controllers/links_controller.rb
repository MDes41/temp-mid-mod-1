require 'uri'

class LinksController < ApplicationController
  def new
  end

  def create
    @link = current_user.links.create(link_params)
    if @link && valid_url?(params)
      flash[:success] = "Link saved!"
      redirect_to links_path
    else
      flash[:notice] = "Link didn't save!"
      redirect_to links_path
    end
  end

  def index
    if current_user != nil
      @links = current_user.links.all
    else

    end
  end

  private

  def link_params
    params.permit(:url, :title)
  end


  def valid_url?(params)
    (uri = URI.parse(params[:url])) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end



end
