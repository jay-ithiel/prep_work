require 'byebug'

class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, presence: true, inclusion: { in: %w(PENDING APPROVED DENIED) }
  validate :overlapping_requests?, :overlapping_approved_requests?

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

  def overlapping_requests?
    overlapping_requests = [get_overlapping_requests]
    return false if overlapping_requests.count < 1
    true
  end

  def overlapping_approved_requests?
    requests = [get_overlapping_requests.where("status = 'APPROVED' AND '#{status}' = 'APPROVED'")]
    return false if requests.count < 1
    true
  end

  def overlapping_pending_requests?
    requests = [get_overlapping_requests.where("status = 'PENDING' AND '#{status}' = 'PENDING'")]
    return false if requests.count < 1
    true
  end

  def get_overlapping_requests
    CatRentalRequest.where("(end_date > '#{start_date}' AND start_date < '#{end_date}')\
                            OR (start_date < '#{end_date}' AND end_date > '#{start_date}')\
                            OR (end_date > '#{end_date}' AND start_date < '#{start_date}')\
                            OR (end_date < '#{end_date}' AND start_date > '#{start_date}')
                            OR start_date = '#{start_date}'").where("cat_id = '#{cat_id}'")
  end

  def approve!
    CatRentalRequest.transaction do
      self.status = "APPROVED"
      get_overlapping_requests.where("status = 'PENDING'").each { |request|  request.deny! }
      self.save!
    end
  end

  def deny!
    self.destroy!
  end

  def pending?
    status == "PENDING"
  end
end
