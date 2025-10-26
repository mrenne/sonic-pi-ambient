###Anemoia #1

use_bpm 88

live_loop :met do
  sleep 1
end

live_loop :frost_viola, sync: :met do
  ##| stop
  sus = (knit 4, 2, 8, 1, 16, 1).choose
  
  midi_note_on (scale :e3, :rast, num_octaves: 1).choose, sustain: sus, port: "virtual_midi_port_1", channe1: 1
  sleep sus
end

live_loop :distance_zero, sync: :met do
  ##| stop
  sus = (knit 1, 2, 2, 4, 4, 1).choose
  
  midi_note_on (scale :e3, :rast, num_octaves: 2).choose, sustain: 2, velocity: sus*20, port: "virtual_midi_port_1", channel: 2
  sleep sus
end

live_loop :blank_forms_degraded_sine, sync: :met do
  #stop
  8.times do
    
    sus = (knit 0.25, 4, 0.5, 2, 1, 1).choose
    
    midi_note_on (scale :e3, :rast, num_octaves: 1).choose, sustain: sus, velocity: sus, port: "virtual_midi_port_1", channel: 3
    sleep sus
  end
  sleep (knit 0, 4, 8, 2, 16, 2, 32, 1).choose
end

live_loop :drone_piano, sync: :met do
  #stop
  4.times do
    sus = (knit 4, 2, 8, 1, 16, 1).choose
    
    midi (scale :e4, :rast, num_octaves: 1).choose, sustain: sus, port: "virtual_midi_port_1", channel: 4
    sleep sus
  end
  sleep (knit 8, 2, 16, 2, 32, 1).choose
end

