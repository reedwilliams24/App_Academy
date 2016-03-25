class Visit < ActiveRecord::Base
  validates :user_id, :shortened_url_id, presence: true

  belongs_to :visitors,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User

  belongs_to :visited_urls,
    foreign_key: :shortened_url_id,
    primary_key: :id,
    class_name: :ShortenedUrl

  def self.record_visit!(user, shortened_url)
    shortened_url_id = ShortenedUrl.where(short_url: shortened_url).first.id
    Visit.create!(user_id: user.id, shortened_url_id: shortened_url_id)
  end
end
