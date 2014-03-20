class User < ActiveRecord::Base
  extend FriendlyId
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  friendly_id :firstname_and_lastname, use: [:slugged, :history]

  validates :website, url: true, allow_nil: true, allow_blank: true
  validates :blog,    url: true, allow_nil: true, allow_blank: true

  has_many :articles, dependent: :nullify, validate: :false
  has_many :talks, dependent: :nullify, validate: :false
  has_many :subscribtions
  has_many :events_subscribed, through: :subscribtions

  def admin?
    self.has_role?(:admin)
  end

  def subscribed_to_event?(event)
    self.events_subscribed.include?(event)
  end

  def full_name
    "#{self.firstname} #{self.lastname}"
  end

  def associated_tags
    talks.map { |t| t.tag_list } .flatten.uniq
  end

  protected
    def firstname_and_lastname
      "#{firstname} #{lastname}"
    end
end
