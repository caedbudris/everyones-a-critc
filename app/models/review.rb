class Review < ActiveRecord::Base
    validates(:content, presence: true, length: { minimum: 25 })
    
    belongs_to :critic
    belongs_to :movie
end
