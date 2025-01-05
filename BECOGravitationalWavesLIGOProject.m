clear all;
close all;

% Brayan Elian Castiblanco Ortigoza
% Gravitational Waves Project - Signal Processing

% Define file names and their respective experiments
files = {"GW190814-L1-BH", "GW190814-H1-BH", "GW170817-L1-NS", "GW170817-H1-NS"};
detectors = {"L1BH", "H1BH", "L1NS", "H1NS"};

% Sampling Parameters
Fs = 4096; % Sampling frequency in Hz
Ts = 1 / Fs; % Sampling period in s
Nw = 2^11; % Window size for Fast Fourier Transform (FFT)

% Physical Constants
c = 3e8; % Speed of light in m/s
G = 6.674e-11; % Gravitational constant in SI units
conversion_factor = c^3 / G; % Conversion factor for energy estimation in Joules

% Loop to analyze the four experiments
for idx = 1:length(files)
    % 1. Load Data
    data = load(char([files{idx}, ".txt"]));
    N = length(data);

    % 2. Time-Domain Analysis
    % Define time axis
    timeAxis = (0:N-1) / Fs;

    figure;
    plot(timeAxis, data);
    title(['Time-Domain Signal - ', detectors{idx}]);
    xlabel('Time (s)');
    ylabel('Signal');
    grid on;

    % 3. Frequency-Domain Analysis
    % Compute Fourier Transform (FFT)
    FSignal = fft(data);
    freq = (0:N-1) * Fs / N; % Defining frequency array

    figure;
    plot(freq, abs(FSignal), 'Marker', 'none');
    xlabel('Frequency (Hz)');
    ylabel('Amplitude |FFT|');
    title(['Frequency-Domain Signal - ', detectors{idx}]);

    % 4. Spectrogram Analysis (sliding Fourier Transform)
    Nsp = floor((N - Nw) / (Nw / 16)); % Number of slices for FFT
    window = hanning(Nw); % Hanning window function

    % Initialize FFT matrix
    GWFFT = zeros(Nw, Nsp);

    % Compute the FFT and store it
    for i = 0:Nsp-1
        GWFFT(:, i+1) = fft(window .* data((i * Nw / 16) + 1 : (i * Nw / 16) + Nw));
    end

    % Define frequency and time axes for the spectrogram
    freq_sp = (0:(Nw-1)) * (Fs / Nw); % Positive frequencies
    time_sp = (0:(Nsp-1)) * (Nw / 16) * Ts; % Time corresponding to each slice

    % Plot spectrogram in log10 scale
    figure;
    pcolor(time_sp, freq_sp, 10*log10(abs(GWFFT))); % Use time and frequency axes, and dB scale
    shading flat;                                   % Remove grid lines
    colorbar;
    xlim([0, max(time_sp)]);                        % Adjust time axis
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    title(['Log10-Scaled Spectrogram - ', detectors{idx}]);

    % 5. Plot linear-scaled spectrogram with frequency limits
    figure;
    pcolor(time_sp, freq_sp, abs(GWFFT));
    shading flat;                           % Remove grid lines
    clim([0, 4e-20]);                       % Adjust range of interest
    ylim([40, 250]);                        % Focus on relevant frequency range
    colorbar;
    xlim([0, max(time_sp)]);
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    title(['Spectrogram - ', detectors{idx}]);

    % Extras:
    
    % Compute Power Spectral Density (PSD)
    [pxx, f_psd] = periodogram(data, [], N, Fs, 'psd'); % Empty window parameter
    figure;
    plot(f_psd, 10*log10(pxx));
    xlabel('Frequency (Hz)');
    ylabel('Power/Frequency (dB/Hz)');
    title(['Power Spectral Density - ', detectors{idx}]);


    % Estimate Energy Radiated by Gravitational Waves
    gw_energy = sum(abs(data).^2) * Ts * conversion_factor;
    fprintf('Estimated Energy for %s: %.3e Joules\n', detectors{idx}, gw_energy);
end