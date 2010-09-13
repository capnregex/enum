class Family < Enum
  enum_fields :description
  enumerate do
    MANUAL 'Manual Workout, No Automation'
    CHIRP 'Audio Chirp workout'
    CANNED 'Builtin Speed / Incline workout at 1 minute incriments'
    PULSE 'Builtin Pulse workouts'
    LEARN 'Built in Custom Workout'
    STEP 'Step Counting Workout'
    DISTANCE 'Reach a Target Distance'
    CALORIE 'Reach a Target Calorie Count'
    HRSS 'Heart Rate Self Select'
    TRAINER 'Wpl1 Macro Segment workout'
    TEST 'A Fitness Test'
    DEMO 'Wpl1 Non Macro segment workout'
  end
end
