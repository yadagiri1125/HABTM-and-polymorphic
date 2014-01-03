class Actor < ActiveRecord::Base
  attr_accessible :first_name, :last_name,:comments_attributes
  has_and_belongs_to_many :movies
  has_many :comments, :as => :commentable, :dependent => :destroy

  accepts_nested_attributes_for :comments,
                                reject_if:lambda { |attrs|
                                  attrs.all? { |key, value| value.blank? }
                                },
                                allow_destroy:true

  def with_blank_comment
    comments.build
    self
end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
