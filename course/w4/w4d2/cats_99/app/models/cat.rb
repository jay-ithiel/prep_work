class Cat < ActiveRecord::Base
  COLORS = %w(black white brown)
  validates :color, presence: true, inclusion: { in: COLORS }
  validates :sex, presence: true, inclusion: { in: %w(M F) }
  validates :birth_date, :name, presence: true

  has_many :cat_rental_requests,
    dependent: :destroy,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest

  def pending_requests?
    pending_requests.size > 0
  end

  def pending_requests
    cat_rental_requests.select { |request| request.pending? }
  end
end
