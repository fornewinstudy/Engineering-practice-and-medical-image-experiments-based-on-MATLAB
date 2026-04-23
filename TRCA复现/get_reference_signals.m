function reference_signals = get_reference_signals(length, target_freq)
    reference_signals = [];

    t = 0:(1/fs):(length/fs);

    reference_signals = [reference_signals; sin(pi * 2 * target_freq * t)];
    reference_signals = [reference_signals; cos(pi * 2 * target_freq * t)];
    reference_signals = [reference_signals; sin(pi * 4 * target_freq * t)];
    reference_signals = [reference_signals; cos(pi * 4 * target_freq * t)];

    reference_signals = reference_signals';
end


