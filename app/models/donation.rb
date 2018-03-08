class Donation < ApplicationRecord
  before_create :set_private_id

  def set_private_id
    self.private_id = SecureRandom.hex(25)
  end

  def to_param
    private_id
  end

end
