
require "test/unit"
require "family"

class TestEnum < Test::Unit::TestCase

  def test_family_ids
    assert_equal Family::MANUAL.id, 0
    assert_equal Family::CHIRP.id, 1
    assert_equal Family::CANNED.id, 2
    assert_equal Family::PULSE.id, 3
    assert_equal Family::LEARN.id, 4
    assert_equal Family::STEP.id, 5
    assert_equal Family::DISTANCE.id, 6
    assert_equal Family::CALORIE.id, 7
    assert_equal Family::HRSS.id, 8
    assert_equal Family::TRAINER.id, 9
    assert_equal Family::TEST.id, 10
    assert_equal Family::DEMO.id, 11
  end

  def test_family_syms
    assert_equal Family::MANUAL.to_sym, :MANUAL
    assert_equal Family::CHIRP.to_sym, :CHIRP
    assert_equal Family::CANNED.to_sym, :CANNED
    assert_equal Family::PULSE.to_sym, :PULSE
    assert_equal Family::LEARN.to_sym, :LEARN
    assert_equal Family::STEP.to_sym, :STEP
    assert_equal Family::DISTANCE.to_sym, :DISTANCE
    assert_equal Family::CALORIE.to_sym, :CALORIE
    assert_equal Family::HRSS.to_sym, :HRSS
    assert_equal Family::TRAINER.to_sym, :TRAINER
    assert_equal Family::TEST.to_sym, :TEST
    assert_equal Family::DEMO.to_sym, :DEMO
  end

  def test_family_names
    assert_equal Family::MANUAL.name, 'MANUAL'
    assert_equal Family::CHIRP.name, 'CHIRP'
    assert_equal Family::CANNED.name, 'CANNED'
    assert_equal Family::PULSE.name, 'PULSE'
    assert_equal Family::LEARN.name, 'LEARN'
    assert_equal Family::STEP.name, 'STEP'
    assert_equal Family::DISTANCE.name, 'DISTANCE'
    assert_equal Family::CALORIE.name, 'CALORIE'
    assert_equal Family::HRSS.name, 'HRSS'
    assert_equal Family::TRAINER.name, 'TRAINER'
    assert_equal Family::TEST.name, 'TEST'
    assert_equal Family::DEMO.name, 'DEMO'
  end

  def test_family_ordinals
    assert_equal Family::MANUAL.ordinal, 0
    assert_equal Family::CHIRP.ordinal, 1
    assert_equal Family::CANNED.ordinal, 2
    assert_equal Family::PULSE.ordinal, 3
    assert_equal Family::LEARN.ordinal, 4
    assert_equal Family::STEP.ordinal, 5
    assert_equal Family::DISTANCE.ordinal, 6
    assert_equal Family::CALORIE.ordinal, 7
    assert_equal Family::HRSS.ordinal, 8
    assert_equal Family::TRAINER.ordinal, 9
    assert_equal Family::TEST.ordinal, 10
    assert_equal Family::DEMO.ordinal, 11
  end

  def test_family_description
    assert_equal Family::MANUAL.description,  'Manual Workout, No Automation'
    assert_equal Family::CHIRP.description,  'Audio Chirp workout'
    assert_equal Family::CANNED.description,  'Builtin Speed / Incline workout at 1 minute incriments'
    assert_equal Family::PULSE.description,  'Builtin Pulse workouts'
    assert_equal Family::LEARN.description,  'Built in Custom Workout'
    assert_equal Family::STEP.description,  'Step Counting Workout'
    assert_equal Family::DISTANCE.description,  'Reach a Target Distance'
    assert_equal Family::CALORIE.description,  'Reach a Target Calorie Count'
    assert_equal Family::HRSS.description,  'Heart Rate Self Select'
    assert_equal Family::TRAINER.description,  'Wpl1 Macro Segment workout'
    assert_equal Family::TEST.description,  'A Fitness Test'
    assert_equal Family::DEMO.description,  'Wpl1 Non Macro segment workout'
  end

  def test_family_values_equality
    assert_equal Family.values, [ Family::MANUAL, Family::CHIRP,
      Family::CANNED, Family::PULSE, Family::LEARN, Family::STEP,
      Family::DISTANCE, Family::CALORIE, Family::HRSS, Family::TRAINER,
      Family::TEST, Family::DEMO ]
  end

  def test_family_value_inequality
    assert_not_equal Family::MANUAL, Family::CHIRP
  end

end

