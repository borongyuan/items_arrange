function  location_amplitude_rank=amplitude_rank_test(diff_location_amplitudeValue,diff_location_amplitudeValue_ThresholdValue)

amplitude_index=diff_location_amplitudeValue/diff_location_amplitudeValue_ThresholdValue;
if amplitude_index<1
  location_amplitude_rank=round(10*amplitude_index);
else
  location_amplitude_rank=10;
end