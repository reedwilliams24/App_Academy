class ShortenedUrl < ActiveRecord::Base
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true

  belongs_to :submitter,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User

  has_many :visits,
    foreign_key: :shortened_url_id,
    primary_key: :id,
    class_name: :Visit

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :visitors

  def self.random_code
    short = SecureRandom::urlsafe_base64(16)
    while ShortenedUrl.exists?(:short_url => short)
      short = SecureRandom::urlsafe_base64(16)
    end
    short
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(long_url: long_url, short_url: ShortenedUrl.random_code, user_id: user.id)
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visits.select('user_id').count
  end

  def num_recent_uniques
    visits.select('user_id').where(created_at >= 10.minutes.ago).count
  end
end
