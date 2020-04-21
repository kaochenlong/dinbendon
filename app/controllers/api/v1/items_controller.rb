class Api::V1::ItemsController < ApplicationController
  def favorite
    render json: {name: 'aaa', age: 18}
  end
end

