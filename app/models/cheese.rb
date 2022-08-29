class Cheese < ApplicationRecord
  
  def index
    cheeses = Cheese.all
    # render  json: cheeses, only: [:id, :name, :price, :is_best_seller]
    render json: cheeses, except: [:created_at, :updated_at]
  end

  def show
    cheese = cheese.find_by(id: params[:id])
    if cheese
      render json: cheeses, except: [:created_at, :updated_at], methods: [:summary]
    else
      render json: {error: 'Cheese not found'}, status: :not_found
    end
  end

  def summary
    "#{name}: $#{price}"
  end

end
