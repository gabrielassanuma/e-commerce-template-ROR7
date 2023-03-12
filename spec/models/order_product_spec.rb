require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  
  describe 'associations' do
    it { should belong_to(:order).optional }
    it { should belong_to(:cart) }
    it { should belong_to(:product) }
  end

  def optional(optional = true)
    remove_submatcher(AssociationMatchers::RequiredMatcher)
    add_submatcher(
      AssociationMatchers::OptionalMatcher,
      name,
      optional,
    )
    self
  end
end
