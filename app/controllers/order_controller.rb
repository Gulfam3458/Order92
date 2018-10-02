class OrderController < ApplicationController
  def index
  end
end
@providers = Provider.all.by_name