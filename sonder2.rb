#sonder 2

midi_scale = [48, 50, 51, 53, 55, 57, 58]
live_loop :ambient1 do
  4.times do
    x = midi_scale[2]
    midi x, channel: 1, port: "virtual_midi_port_1", sustain: [1.0,0.8,0.6].look
    sleep 0.25
  end
  4.times do
    x = midi_scale[6] + 4
    midi x, channel: 1, port: "virtual_midi_port_1", sustain: [1.0, 0.8, 0.6].look
    sleep 0.25
  end
end
