require_relative '../lib/player'

describe "Player method" do
  it "should make random dmg" do
    expect(gets_damage(6)).to eq(4)
  end
end
