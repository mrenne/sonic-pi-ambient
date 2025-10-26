bpm = 80

atmos = "C:/Users/eekbo/Desktop/samps/atmos"

live_loop :atmos do
  #stop
  sample atmos,4, rate: 1, amp: 0.5
  sleep 8
end

live_loop :atmos2, sync: :atmos do
  stop
  with_fx :bitcrusher do
    sample atmos, 10, rate: 1, amp: 0.5,
      rpitch: (scale :minor_pentatonic).choose
    sleep 8
  end
end


