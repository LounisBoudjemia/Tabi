class Trip < ApplicationRecord
  has_one_attached :photo
  has_many :stops
  has_many :checklists

  validates :name, presence: true
  validates :start_date, presence: true

  def formatted_end
    return end_date if end_date.blank?

    end_date.strftime("%d-%m-%Y")
  end
end
