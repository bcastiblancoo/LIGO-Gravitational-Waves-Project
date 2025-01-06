# LIGO-Gravitational-Waves-Project

# Gravitational Waves Project - Signal Processing

## Overview
This repository contains the MATLAB script and the corresponding report for the analysis of gravitational wave signals from two landmark events: **GW190814** (black hole merger) and **GW170817** (binary neutron star inspiral). The project uses advanced signal processing techniques to extract meaningful insights from the strain data recorded by LIGO detectors.

## Contents
- `BECO_Gravitational_Waves_Project_Signal_Processing.pdf`: The complete project report detailing the methodology, results, and conclusions.
- `BECOGravitationalWavesProject.m`: The MATLAB script implementing the analysis.

## Project Goals
1. Analyze the time-domain signals to observe characteristic patterns (e.g., chirps).
2. Perform frequency-domain analysis using the Fast Fourier Transform (FFT) to identify dominant spectral features.
3. Use spectrograms to capture the temporal evolution of frequency content.
4. Compute the Power Spectral Density (PSD) to quantify signal power distribution across frequencies.
5. Estimate the energy radiated by gravitational waves using numerical integration techniques.

## How to Use
### MATLAB Script
1. Ensure MATLAB is installed on your system.
2. Place the `.m` script and corresponding data files in the same directory.
3. Run the script `BECOGravitationalWavesProject.m` in MATLAB.
4. The script generates:
   - Time-domain plots
   - Frequency-domain (FFT) plots
   - Spectrograms (logarithmic and linear scales)
   - Power Spectral Density (PSD) plots
   - Estimated energy values for the gravitational wave events

### Report
The PDF report provides a detailed explanation of the methodology, the physical and mathematical foundations of gravitational waves, the results of the analysis, and the conclusions drawn from the study.

## Key Results
- **GW190814**: Spectral peaks at \(500 \, \mathrm{Hz}\) and \(1000 \, \mathrm{Hz}\), with harmonics near \(3100 \, \mathrm{Hz}\) and \(3600 \, \mathrm{Hz}\). Characteristic chirp pattern visible in time-frequency analysis.
- **GW170817**: Dominant frequencies at \(500 \, \mathrm{Hz}\), \(1000 \, \mathrm{Hz}\), and \(1500 \, \mathrm{Hz}\), with harmonics near \(3100 \, \mathrm{Hz}\) and \(3600 \, \mathrm{Hz}\). Longer-duration chirp reflecting the inspiral of neutron stars.
- Energy estimations highlight the faint nature of gravitational wave signals by the time they reach Earth.

## References
This project builds on established methods and data from the following key publications:
1. *GW170817: Observation of Gravitational Waves from a Binary Neutron Star Inspiral* ([DOI:10.1103/PhysRevLett.119.161101](https://arxiv.org/abs/1710.05832)).
2. *Review of the Advanced LIGO Gravitational Wave Observatories Leading to Observing Run Four* ([DOI:10.1088/1361-6382/acba1b](https://iopscience.iop.org/article/10.1088/1361-6382/acba1b)).
3. *GW190814: Gravitational Waves from the Coalescence of a 23 Solar Mass Black Hole with a 2.6 Solar Mass Compact Object* ([DOI:10.3847/2041-8213/ab960f](https://iopscience.iop.org/article/10.3847/2041-8213/ab960f)).

