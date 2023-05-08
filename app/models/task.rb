class Task < ApplicationRecord
  belongs_to :list, optional: true, index: true
end
