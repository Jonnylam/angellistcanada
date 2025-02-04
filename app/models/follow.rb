class Follow < ActiveRecord::Base

  extend ActsAsFollower::FollowerLib
  extend ActsAsFollower::FollowScopes


  # NOTE: Follows belong to the "followable" interface, and also to followers
  belongs_to :followable, :polymorphic => true
  belongs_to :follower,   :polymorphic => true

  # belongs_to :followable, class_name: 'User'
  # belongs_to :follower, class_name: 'User'

  def block!
    self.update_attribute(:blocked, true)
  end

end
