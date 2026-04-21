% Digital Filter Specifications:
wp= 0.2 *pi; % digital Passband freq in rad
ws = 0.3*pi; % digital Stopband freq in rad
Rp = 1; % Passband ripple in dB
As = 15; % Stopband attenuation in dB
% Analog Prototype Specifications:
T = 1; % Set T =1
OmegaP = (2/T)*tan(wp/2); % Prewarp Prototype Passband freq
OmegaS = (2/T),tan(ws/2); % Prewarp Prototype Stopband freq
% Analog Prototype Order Calculation:
N = ceil((log10((10^(Rp/10)-1)/(10^(As/10)-1)))/(2*log10(0megaP/0megaS)));
fprintf('\n*** Butterworth Filter Order = %2.0f \n',N);
Butterworth Filter Order = 6
0megaC = 0megaP/((10^(Rp/10)-1)^(1/(2*N))); % Analog BW prototype cutoff
wn = 2 * atan((OmegaC * T)/2); % Digital BW cutoff freq
% Digital Butterworth Filter Design:
wn = wn/pi; % Digital Butter cutoff in pi units
[b,a] = butter(N, wn);
[b0,B,A] = dirccas(b,a);