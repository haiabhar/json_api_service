class Rating < ApplicationRecord
  belongs_to :post
  validates :star, numericality: {:only_integer => true }, if: :non_zero_max_five?
  validates :post_id, presence: true, :numericality => {:only_integer => true}

private
  def non_zero_max_five?
   if self.star < 1
       self.errors.add(:star, "Field can't be above zero")
    elsif self.star > 5
       self.errors.add(:star, "Rating Should be below Five")
    end
  end
end
