class CheckinCheckoutHistory < ApplicationRecord
  enum user_checkin_checkout_status: [:not_available, :checkin, :checkout]
  belongs_to :user


  def self.is_checkin?(user)
    if is_user_available?(user)
      user_record = CheckinCheckoutHistory.where(user_id: user.id).last
      user_record.checkin?
    end
      return false
  end

  def self.is_checkout?(user)
    if is_user_available?(user)
      user_record = CheckinCheckoutHistory.where(user_id: user.id).last
      return user_record.checkout?
    else
      return false
    end
  end

  def self.is_user_available?(user)
    CheckinCheckoutHistory.find_by(user_id: user.id).present?
  end
  
end
