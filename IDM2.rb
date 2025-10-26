use_bpm 123

kick="C:/Users/mike_/Music/samps/perc/oneshot/kick1.wav"
hhc1="C:/Users/mike_/Music/samps/perc/oneshot/hhc2.wav"
clap="C:/Users/mike_/Music/samps/perc/oneshot/clap2.wav"
hho="C:/Users/mike_/Music/samps/perc/oneshot/hho2.wav"
vox1="C:/Users/mike_/Music/samps/vox/spoken.wav"

live_loop :met1 do
  sleep 1
end

define :pattern do |pattern|
  return pattern.ring.tick == "x"
end

live_loop :kick, sync: :met1 do
  #stop
  a = 1
  sample kick, amp: a if pattern "x-----x---x--x--"
  sleep 0.25
end

live_loop :hhc, sync: :met1 do
  #stop
  sample hhc1 if pattern "x-x-x-x-xxx-x-x-"
  sleep 0.125
end

live_loop :hho, sync: :met1 do
  #stop
  sleep 0.5
  sample hho
  sleep 0.5
end

live_loop :clap, sync: :met1 do
  #stop
  sleep 1
  sample clap, amp: 1.2, cutoff: 120
  sleep 1
end

with_fx :reverb, mix: 0.6 do
  with_fx :panslicer, mix: 0.3 do
    live_loop :vox, sync: :met1 do
      #stop
      a = 2.2
      p = 0
      b = vox1
      sample b, amp: a, pan: p, rate: 0.96, pitch: 0
      sleep 16
    end
  end
end

with_fx :reverb, mix: 0.6 do
  live_loop :arp, sync: :met1 do
    #stop
    a = line(0.5, 1, steps: 128).mirror.look
    r = line(0.25, 0.5, steps: 128).mirror.look
    use_synth :dsaw
    notes = (ring :e3, :g3, :b3, :d4, :e4, :g4, :b4, :d5).shuffle
    tick
    play notes.look, amp: a, cutoff: 70, release: r, pan: 0.25
    sleep 0.25
  end
end

live_loop :synth1, sync: :met1 do
  #stop
  a = 0.3
  use_synth :saw
  32.times do
    play :c2, amp: a, pan: p
    sleep 0.25
  end
  32.times do
    play :g2, amp: a, pan: p
    sleep 0.25
  end
  32.times do
    play :bb2, amp: a, pan: p
    sleep 0.25
  end
  32.times do
    play :c2, amp: a, pan: p
    sleep 0.25
  end
end

live_loop :synth2, sync: :met1 do
  #stop
  a = 0.3
  p = [0.5, -0.5].choose
  use_synth :saw
  32.times do
    play :c3, amp: a, pan: p
    sleep 0.25
  end
  32.times do
    play :g3, amp: a, pan: p
    sleep 0.25
  end
  32.times do
    play :bb3, amp: a, pan: p
    sleep 0.25
  end
  32.times do
    play :c3, amp: a, pan: p
    sleep 0.25
  end
end

live_loop :arpsynth, sync: :met1 do
  #stop
  p = 0.2
  c = 100
  a = 0.8
  r = 0.15
  use_synth :prophet
  arpc = (ring :c3, :eb3, :g3, :c4, :eb4, :g4, :c5, :eb5)
  arpg = (ring :g2, :bb2, :d3, :g3, :bb3, :d4, :g4, :bb4)
  arpbb = (ring :bb2, :d3, :f3, :bb3, :d4, :f4, :bb4, :d5)
  32.times do
    play arpc.tick, release: r, pan: p, cutoff: c, amp: a
    sleep 0.25
  end
  32.times do
    play arpg.tick, release: r, pan: p, cutoff: c, amp: a
    sleep 0.25
  end
  32.times do
    play arpbb.tick, release: r, pan: p, cutoff: c, amp: a
    sleep 0.25
  end
  32.times do
    play arpc.tick, release: r, pan: p, cutoff: c, amp: a
    sleep 0.25
  end
end