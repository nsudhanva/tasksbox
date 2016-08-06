class SayController < ApplicationController
  #load and authorize needs  model to work

  authorize_resource class: false
  
  def hello

  end

  def assignment

  end

  def goodbye
  	
  end

  def products
  	@products = ["marker", "pencil", "box", "pen"]
  end
end
