class Outing <ApplicationRecord
    has_many :contestant_outings
    has_many :contestants, through: :contestant_outings

    def total_contestants
      contestants.count
    end

    def all_contestants
      contestants.map {|contestant| contestant.name}.join(", ")
    end
end
