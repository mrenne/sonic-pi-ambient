###Anemoia #2

use_bpm 88

live_loop :met do
  sleep 1
end

define :frost_viola do |length, vel|
  ##| stop
  sus = (knit length*4, 2, length*8, 1, length*16, 1).choose
  
  midi_note_on (scale :e3, :rast, num_octaves: 1).choose, sustain: sus, velocity: vel, port: "virtual_midi_port_1", channe1: 1
  sleep sus
end

define :distance_zero do |length, vel|
  ##| stop
  sus = (knit length*1, 2, length*2, 4, length*4, 1).choose
  
  midi_note_on (scale :e3, :rast, num_octaves: 2).choose, sustain: sus, velocity: vel, port: "virtual_midi_port_1", channel: 2
  sleep sus
end

define :blank_forms_degraded_sine do |oct, vel|
  #stop
  8.times do
    
    sus = (knit 0.25, 4, 0.5, 2, 1, 1).choose
    
    midi_note_on (scale :e3, :rast, num_octaves: 1*oct).choose, sustain: 2, velocity: sus*10*vel, port: "virtual_midi_port_1", channel: 3
    sleep sus
  end
  sleep (knit 0, 4, 8, 2, 16, 2, 32, 1).choose
end

define :drone_piano do |n|
  #stop
  4.times do
    sus = (knit 4, 2, 8, 1, 16, 1).choose
    
    midi (scale :e4, :rast, num_octaves: 1).choose, sustain: sus, velocity: [10*n,25*n,50,75,75], port: "virtual_midi_port_1", channel: 4
    sleep sus
  end
  sleep (knit 8, 2, 16, 2, 32, 1).choose
end

live_loop :phase_control, sync: :met do
  stop
  phrase = (knit 1, 4, 2, 2, 3, 1).choose
  if phrase == 1 then
    repeats = 12
  end
  if phrase == 2 then
    repeats = 8
  end
  if phrase == 3 then
    repeats = 4
  end
  
  repeats.times do
    live_loop :frost_viola_phrase do
      stop
      if phrase == 1 then
        frost_viola phrase, 100
      end
      if phrase == 2 then
        frost_viola phrase, 50
      end
      if phrase == 3 then
        frost_viola phrase, 10
      end
    end
  end
  
  live_loop :distance_zero do
    stop
    if one_in(4-(1/phrase)) then
      if phrase == 1 then
        sleep 1
      end
    end
    if phrase == 2 then
      distance_zero phrase, 50
    end
    if phrase == 3 then
      distance_zero phrase, 10
    end
  end
end
