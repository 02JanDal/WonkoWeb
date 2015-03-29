class WonkoFile
  include Mongoid::Document
  include Mongoid::Slug

  field :uid, type: String
  field :name, type: String
  attr_readonly :uid

  validates :uid, presence: true, length: { minimum: 4 }
  validates :name, presence: true, length: { minimum: 4 }

  embeds_many :wonkoversions, class_name: 'WonkoVersion', inverse_of: :wonkofile
  belongs_to :user

  paginates_per 20
  slug(&:uid)
end
