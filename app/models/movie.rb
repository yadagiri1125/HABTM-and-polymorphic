class Movie < ActiveRecord::Base
  attr_accessible :title, :duration,:comments_attributes,:actor_ids
  has_and_belongs_to_many :actors
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

  protected


end