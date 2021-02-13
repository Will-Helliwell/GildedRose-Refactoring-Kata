require 'item'

describe Item do

  it "responds to .new" do
    expect(described_class).to respond_to(:new)
  end
  
end
