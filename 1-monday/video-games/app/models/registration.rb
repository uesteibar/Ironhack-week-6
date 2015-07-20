class Registration < ActiveRecord::Base
  belongs_to :tournament
  belongs_to :user

  validate :is_unique_registration

  def is_unique_registration
    unless Registration.where("user_id = ?", user_id).where("tournament_id = ?", tournament_id).size == 0
      errors.add(:user_id, "this registration already exists")
      errors.add(:tournament_id, "this registration already exists")
    end
  end
end
