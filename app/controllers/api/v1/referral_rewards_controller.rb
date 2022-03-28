class Api::V1::ReferralRewardsController < Api::V1::ApiController
  def index
    rewards = ReferralReward.where(event_id: params[:event_id]).limit(params[:limit]).offset(params[:offset])
    render json: rewards
  end

  def show
    reward = ReferralReward.find(params[:id])
    if reward
      if params[:guest_id].present?
        render json: reward.guest_referral_rewards.where(guest_id: params[:guest_id]).first
      else
        render json: reward
      end
    else
      render json: reward.errors(), status: :not_found
    end
  end

  def create
    reward = ReferralReward.new(event_id: params[:event_id], **reward_params.to_h)
    if reward.save
      render json: reward.to_json, status: :created
    else
      render json: reward.errors, status: :unprocessable_entity
    end
  end
  
  def update
    reward = ReferralReward.find(params[:id])
    if reward.update(reward_params)
      render json: reward.to_json, status: :ok
    else
      render json: reward.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    reward = ReferralReward.find(params[:id])
    reward.destroy
    head :ok
  end
  
  private

  def reward_params
    params.permit(:reward, :min_count)
  end
end