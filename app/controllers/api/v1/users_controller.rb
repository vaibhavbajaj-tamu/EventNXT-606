class Api::V1::UsersController < Api::V1::ApiController
  def index
    users = User.where(deactivated: false).limit(params[:limit]).offset(params[:offset])
    render json: users
  end

  def show
    user = User.find(params[:id])
    if user
      render json: user
    else
      render json: user.errors(), status: :not_found
    end
  end

  def update
    user = User.find(params[:id])
    logger.debug(user_params)
    if user.update(user_params)
      render json: user.to_json, status: :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    user = User.find(params[:id])
    user.update_attribute(:deactivated, true)
    head :ok 
  end

  private 
  
  def user_params
    params.permit(:is_admin, :deactivate)
  end
end