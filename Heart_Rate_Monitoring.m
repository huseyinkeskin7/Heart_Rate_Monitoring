clc; close all; clear all;

s = serialport("/dev/cu.wchusbserial14400", 115200); % connecting serial port
fsampling = 128; % declaring sampling frequency

% subplot for time domain and frequency domain plots
figure;
subplot(211)
hLine = animatedline; % animated line for time domain plot
title('Time Domain');
xlabel('Time');
ylabel('Sensor Value');

subplot(212)
hFreqLine = animatedline;  % animated line for freq domain plot
title('Frequency Domain');
xlabel('Frequency(Hz)');
ylabel('Amplitude');
xlim([-fsampling/2, fsampling/2]); % arranging x limits for freq domain plot



sensorValues = []; % we are collecting sensor data in this vector
len_data = 0;   % variable that stores current lenght of data
current_index = 0; % stores current data index
error_filter = 0.26;  % error rate for dominant frequency calculation
freq_value=0.0; % stores current frequency value
bpm=0; % stores current bpm value


freqText = uicontrol('Style', 'text', 'Position', [10 10 100 20], 'String', 'Frequency: ', 'FontSize', 10);% a text area for printing current freq value
bpmText = uicontrol('Style', 'text', 'Position', [20 30 100 20], 'String', 'Bpm: ', 'FontSize', 10);% a text area for printing current bpm value

% Real time data reading and plotting
while ishandle(hLine)
    len_data = len_data + 1; % we are increasing lenght of data every iteration

    data = str2double(readline(s)); % read the data from serial port
    sensorValues = [sensorValues  data];  % add the data to sensor value vector
    current_index = current_index +1; %update current index


    subplot(211)
    addpoints(hLine, current_index/fsampling, data);  % add the new sensor data to plot
    xlim([current_index/fsampling - 0.5, current_index/fsampling + 0.5]); % dynamic x axes according to current index. we also divide current index to sampling freq to obtain sampling time
    drawnow limitrate;
    
    

    fftLen = 256;%fft lenght
    if len_data>fftLen+1 % if data collected
        subplot(212)

        % Performing Fourier transform
        dataToFFT = detrend(sensorValues(end-fftLen+1:end));% fft for last 256 data. 
        fftResult = fft(dataToFFT);
        fftResult = fftshift(abs(fftResult));  % Shift zero frequency component to the center
        fftFrequency = linspace(-fsampling/2, fsampling/2, fftLen);

        % Update the frequency-domain plot
        clearpoints(hFreqLine);
        addpoints(hFreqLine, fftFrequency, fftResult);
        drawnow limitrate;

        indice = find(abs(fftResult)==max(abs(fftResult)));%finding max freq value in freq domain
        if length(indice)>1
            freq_value = fftFrequency(indice(end))-error_filter; % obtaining frequency
            bpm  = round(freq_value*60); % obtainin bpm 
            set(freqText, 'String', ['F(Hz): ' num2str(freq_value)]); %print freq to text area
            set(bpmText, 'String', ['BPM: ' num2str(bpm)]);%print bpm to text area
        end

    end

end

% close serial communication
delete(s);
clear s;

