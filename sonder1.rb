#There is No Self

#https://hydra.ojack.xyz/?code=JTJGJTJGJTIwbGljZW5zZWQlMjB3aXRoJTIwQ0MlMjBCWS1OQy1TQSUyMDQuMCUyMGh0dHBzJTNBJTJGJTJGY3JlYXRpdmVjb21tb25zLm9yZyUyRmxpY2Vuc2VzJTJGYnktbmMtc2ElMkY0LjAlMkYlMEElMkYlMkYlMjBTdW1ldCUwQSUyRiUyRiUyMGJ5JTIwUmFuZ2dhJTIwUHVybmFtYSUyMEFqaSUwQSUyRiUyRiUyMGh0dHBzJTNBJTJGJTJGcmFuZ2dhcHVybmFtYWFqaTEud2l4c2l0ZS5jb20lMkZwb3J0Zm9saW8lMEFvc2MoMC41JTJDJTIwMS4yNSklMEElMDkubXVsdChzaGFwZSgxJTJDJTIwMC4wOSklMEElMDklMDkucm90YXRlKDEuNSkpJTBBJTA5LmRpZmYoZ3JhZGllbnQoKSklMEElMDkuYWRkKHNoYXBlKDIlMkMlMjAyKSUwQSUwOSUwOS5ibGVuZChncmFkaWVudCgxKSkpJTBBJTA5Lm1vZHVsYXRlKG5vaXNlKCklMEElMDklMDkubW9kdWxhdGUobm9pc2UoKSUwQSUwOSUwOSUwOS5zY3JvbGxZKDElMkMlMjAwLjAxMSkpKSUwQSUwOS5ibGVuZChvMCklMEElMDkuY29sb3IoLjAyMzU0JTJDJTIwLTAuNSUyQyUyMC0wLjMxMSklMEElMDkub3V0KCklM0I%3D

use_random_seed 787

live_loop :note1 do
  midi_note_on (scale :e3, :minor_pentatonic).choose, sustain: choose([5,7,9]), port: "virtual_midi_port_1", channel: 1
  sleep 8
end

live_loop :note2 do
  midi_note_on  (scale :e3, :minor_pentatonic).choose, sustain: choose([5,7,9]), port: "virtual_midi_port_1", channel: 2
  sleep 10
end

live_loop :note3 do
  midi_note_on choose([:B4,:Cs5,:E5]), sustain: choose([5,7,9]), port: "virtual_midi_port_1", channel: 3
  sleep 11
end

live_loop :note4 do
  midi_note_on choose([:D2, :A2, :Fs2, :G2]), sustain: choose([7,8,10]), port: "virtual_midi_port_1", channel: 4
  sleep 14
end