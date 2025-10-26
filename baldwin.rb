baldwin = "C:/Users/Mike/Music/samps/spoken_word/baldwin_cavett.mp3"
baldwin2 ="C:/Users/Mike/Music/samps/spoken_word/baldwin_cavett_2.mp3"
beat = "C:/Users/Mike/Music/samps/abstract_electronica/Drum Loops/100 SlowMoBreak.wav"
bass = "C:/Users/Mike/Music/samps/abstract_electronica/Bass Loops/100 MelodicBass F.wav"


use_bpm 60
use_random_seed 1544
a = 0.125 #global amp

live_loop :met do
  sleep 1
end

live_loop :baldwin, sync: :met do
  #stop
  with_fx :reverb, mix: 0.4 do
    sample baldwin, start: 0.0, finish: 0.0035 #add someone - cavett
    sleep 4
    #sample baldwin2, start: 0.01, finish: 0.0999 #left this country
    #sleep 12
    stop
  end
end

live_loop :bass, sync: :met do
  #stop
  sample bass, amp: a*3, beat_stretch: 5
  sleep 5
end

live_loop :ambient_pad, sync: :met do
  #stop
  use_synth :hollow
  with_fx :reverb, room: 1, mix: 0.6 do
    play chord(:D3, :minor), attack: 4, release: 6
    sleep 8
    play chord(:A3, :minor), attack: 4, release: 6
    sleep 8
  end
end

live_loop :evolving_pad, sync: :met do
  use_synth :blade
  notes = (chord :C3, :m7, num_octaves: 2)
  play notes.choose, attack: 3, release: 5, amp: a, cutoff: rrand(80, 100)
  sleep 4
end

live_loop :drums, sync: :met do
  #stop
  with_fx :reverb, room: 0.5 do
    sample beat, amp: a*3, beat_stretch: 5
    sleep 5
  end
end


live_loop :vynil, sync: :met do
  sample :vinyl_hiss, amp: a*5, lpf: 120, pan: 0.25
  sleep 3.8
end

live_loop :vynil2, sync: :met do
  sample :vinyl_hiss, amp: a*5, lpf: 90, pan: 0.25
  sleep 3.8
end
