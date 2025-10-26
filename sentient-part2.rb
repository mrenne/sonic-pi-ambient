##  Sentient - Part 2
##  https://gist.github.com/nischalshrestha/af306646dfa344aed9a9787328cc2982

bpm = 80

with_fx :reverb, room: 0.8, mix: 0.6 do
  
  live_loop :deep_saws do
    stop
    use_synth :saw
    amp = 0.2
    release = rrand_i(5, 8)
    attack = rrand(0.8, 3.0)
    with_fx :lpf, cutoff: 80 do
      play (scale :c1, :major_pentatonic, num_octaves: 2).choose,
        attack: attack,
        sustain: 1,
        release: release,
        amp: amp
    end
    sleep release
  end
  
  live_loop :bass_pluck_wind_up do
    stop
    use_synth :pluck
    amp = 0.4
    with_fx :echo, decay: 5 do
      with_fx :lpf, cutoff: (line 80, 100, steps: 5).tick do
        play (scale :c3, :major_pentatonic, num_octaves: 2).look,
          attack: 0,
          sustain: 0.5,
          release: 1,
          amp: amp,
          pan: rrand(-1, -1)
      end
    end
    sleep 0.5
  end
  
  live_loop :bass_pluck_wind_down_delayed do
    stop
    use_synth :pluck
    sleep(0.25)
    amp = 0.2
    with_fx :echo, decay: 5 do
      with_fx :lpf, cutoff: (line 80, 100, steps: 5).reverse.tick do
        play (scale :c3, :major_pentatonic).reverse.look,
          attack: 0,
          sustain: 0.5,
          release: 1,
          amp: amp,
          pan: rrand(-1, 1)
      end
    end
    sleep 0.5
  end
  
  live_loop :ping_pong_pluck do
    stop
    use_synth :pluck
    sleep rrand_i(0.1, 0.25)
    amp = 0
    with_fx :echo, decay: 6 do
      with_fx :echo, decay: 3 do
        with_fx :echo, decay: 2 do
          with_fx :panslicer, mix: 0.2, pan_min: -0.5, pan_max: 0.5 do
            with_fx :lpf, cutoff: (line 60, 100, steps: 5).tick do
              play (scale :c5, :major_pentatonic).choose,
                attack: 0,
                sustain: 0.25,
                release: 0.5,
                amp: amp
            end
          end
        end
      end
    end
    sleep 0.325
  end
  
  
end

