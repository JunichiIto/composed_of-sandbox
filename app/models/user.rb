class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :rate_value,
            format: {with: /\A\d+(\.\d{1,2})?\z/},
            numericality: {more_than_or_equal_to: 0, less_than_or_equal_to: 100}

  composed_of :rate, class_name: "Rating", mapping: %w(rate_value value)
end
