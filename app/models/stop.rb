class Stop < ApplicationRecord
  belongs_to :trip
  has_many :activities

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def formatted_start
    return start_date if start_date.blank?

    start_date.strftime("%d-%m-%Y")
  end

  def formatted_end
    return end_date if end_date.blank?

    end_date.strftime("%d-%m-%Y")
  end

  validates :name, presence: true
end
