##| Music for airports by Brian Eno

sampchoir = "C:/Users/mike_/Music/samps/eno_sp/Choir"
samppiano = "C:/Users/mike_/Music/samps/eno_sp/Piano"

define :enoloop do |n, samp|
  in_thread do
    loop do
      sample samp, (n - 1)
      sleep sample_duration samp, (n - 1)
    end
  end
end

enoloop 1, samppiano
enoloop 2, samppiano
enoloop 3, samppiano
enoloop 4, samppiano
enoloop 5, samppiano
enoloop 6, samppiano
enoloop 7, samppiano
enoloop 8, samppiano

enoloop 1, sampchoir
enoloop 2, sampchoir
enoloop 3, sampchoir
enoloop 4, sampchoir
enoloop 5, sampchoir
enoloop 6, sampchoir
enoloop 7, sampchoir


with_fx :reverb, mix: 0.5 do
  live_loop :oceans do
    s = synth [:bnoise, :cnoise, :gnoise].choose, amp: rand(0.05..0.075), attack: rrand(0, 4),
      sustain: rrand(0, 2), release: rrand(1, 3), cutoff_slide: rrand(0, 5), cutoff: rrand(60, 100),
      pan: rrand(-1, 1), pan_slide: rrand(1, 5)# ,  amp: rrand(0.150, 0.3)
    control s, pan: rrand(-1, 1), cutoff: rrand(60, 70)
    sleep rrand(1, 3)
  end
end