class Task < ApplicationRecord

  belongs_to :user

  include AASM

  enum state: {
    created: 0,
    finished: 1
  }

  aasm column: :state, enum: true do
    state :created, initial: true
    state :finished

    event :finish do
      transitions from: :created, to: :finished
    end
  end

end
