class CatalogsController < ApplicationController

  before_filter :only_admin
  def index
  end

end
