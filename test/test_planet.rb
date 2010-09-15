
require "test/unit"
require "planet"

class TestPlanet < Test::Unit::TestCase
  def test_planet
    mass = Planet::EARTH.mass_of 175
    assert_in_delta  66.107583, Planet::MERCURY.surface_weight(mass), 0.000001
    assert_in_delta 158.374842, Planet::VENUS.surface_weight(mass)  , 0.000001
    assert_in_delta 175.000000, Planet::EARTH.surface_weight(mass)  , 0.000001
    assert_in_delta  66.279007, Planet::MARS.surface_weight(mass)   , 0.000001
    assert_in_delta 442.847567, Planet::JUPITER.surface_weight(mass), 0.000001
    assert_in_delta 186.552719, Planet::SATURN.surface_weight(mass) , 0.000001
    assert_in_delta 158.397260, Planet::URANUS.surface_weight(mass) , 0.000001
    assert_in_delta 199.207413, Planet::NEPTUNE.surface_weight(mass), 0.000001
  end
end


