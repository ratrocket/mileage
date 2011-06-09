class Notes < ActiveRecord::Base
  belongs_to :bike
  belongs_to :ride  # not at the same time though...
end
