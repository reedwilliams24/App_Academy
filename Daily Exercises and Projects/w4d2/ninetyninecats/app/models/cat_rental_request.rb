class CatRentalRequest < ActiveRecord::Base
  validates :status, :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: {in: ['PENDING', 'APPROVED', 'DENIED']}

  belongs_to :cat,
    foreign_key: :cat_id,
    class_name: Cat

  def overlapping_requests
    query = CatRentalRequest.find_by_sql(<<-SQL)
      SELECT DISTINCT their_req.*
      FROM cat_rental_requests AS my_req
      JOIN cat_rental_requests AS their_req
        ON my_req.cat_id = their_req.cat_id
      WHERE (their_req.start_date BETWEEN my_req.start_date AND my_req.end_date OR
            my_req.start_date BETWEEN their_req.start_date AND their_req.end_date)
    SQL

    query.select{|req| req.id != self.id}
  end

  def overlapping_approved_requests
    overlapping_requests.select{|req| req.status == 'APPROVED'}
  end

end
