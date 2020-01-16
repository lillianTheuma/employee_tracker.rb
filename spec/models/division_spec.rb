require 'rails_helper'

describe Division do
  # Tests will go here.
  it { should have_many(:employees) }
  it { should validate_presence_of :name }
  it { should validate_length_of(:name).is_at_most(100) }
  it("titleizes the name of an division") do
    division = Division.create({name: "marketing"})
    expect(division.name()).to(eq("Marketing"))
  end
end
