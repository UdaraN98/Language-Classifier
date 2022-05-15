%% training part

l2 = 8192;
ds=dir('C:\Users\chami\Desktop\lab\digital_signal_processing\task03\task03\resampled_sinhala\*.wav');
dt=dir('C:\Users\chami\Desktop\lab\digital_signal_processing\task03\task03\resampled_tamil\*.wav');

ratio_s = size(length(ds));
ratio_t = size(length(dt));
%desighn two filters
[num_1, den_1] =butter(6,[250,750]/(8000/2),'bandpass');
[num_2, den_2] =butter(6,[1000,1500]/(8000/2),'bandpass');

for q=1:length(ds)
    temp_sinhala=ds(q).name;
    temp_tamil=dt(q).name;
    
      [ys,fs1] = audioread(['C:\Users\chami\Desktop\lab\digital_signal_processing\task03\task03\resampled_sinhala\',temp_sinhala]);
      [yt,fs2] = audioread(['C:\Users\chami\Desktop\lab\digital_signal_processing\task03\task03\resampled_tamil\',temp_tamil]);
      
      y_sin= fft(ys);
      y_abs1 = abs(y_sin);
       
      y_tam= fft(yt);
      y_abs2 = abs(y_tam);
      
%       figure
%       plot((0:(l2/2)-1)*fs1/l2,y_abs1(1:l2/2),'b')
%       hold on
%       plot((0:(l2/2)-1)*fs2/l2,y_abs2(1:l2/2),'r')
%       
      %filter sinhala by filter 01
      y_filter1s = filter(num_1, den_1, ys);
      y_ft1s = fft(y_filter1s,l2);
      y_ft_abs1s = abs(y_ft1s);
      
      %filter sinhala by filter 02
      y_filter2s = filter(num_2, den_2, ys);
      y_ft2s = fft(y_filter2s,l2);
      y_ft_abs2s = abs(y_ft2s); 
      
      %ratio of sinhala after filtering
      ratio_s(q) = sum((y_ft_abs1s).^2)/sum((y_ft_abs2s).^2);
      
       %filter tamil by filter 01
      y_filter1t = filter(num_1, den_1, yt);
      y_ft1t = fft(y_filter1t,l2);
      y_ft_abs1t = abs(y_ft1t);
      
      %filter tamil by filter 02
      y_filter2t = filter(num_2, den_2, yt);
      y_ft2t = fft(y_filter2t,l2);
      y_ft_abs2t = abs(y_ft2t); 
      
      %ratio of tamil after filtering
      ratio_t(q) = sum((y_ft_abs1t).^2)/sum((y_ft_abs2t).^2);
         
end  

% % scatter plot of two ratios
% z =zeros(length(ds),1);
% figure;
% scatter(ratio_s,z,'b');
% hold on;
% scatter(ratio_t,z,'r');
% xlim([0,2000])

%% testing part

d=dir('C:\Users\chami\Desktop\lab\digital_signal_processing\task03\task03\test_re_sinhala\*.wav');
b=dir('C:\Users\chami\Desktop\lab\digital_signal_processing\task03\task03\test_re_tamil\*.wav')

ratio_ts = size(length(d));
ratio_tt = size(length(b));
cout =0;

for p=1:length(d)
    temp_sinhala_test =d(p).name;
    temp_tamil_test= b(p).name;
    
    [ytests,ftests1] = audioread(['C:\Users\chami\Desktop\lab\digital_signal_processing\task03\task03\test_re_sinhala\',temp_sinhala_test]);
    [ytestt,ftests2] = audioread(['C:\Users\chami\Desktop\lab\digital_signal_processing\task03\task03\test_re_tamil\',temp_tamil_test]);
    
    
    y_test_filter1s = filter(num_1, den_1, ytests);
    y_testft1s = fft(y_test_filter1s,l2);
    y_ft_abs1s_test = abs(y_testft1s);
    
     y_test_filter2s = filter(num_2, den_2, ytests);
     y_testft2s = fft(y_test_filter2s,l2);
     y_ft_abs2s_test = abs(y_testft2s); 
     
      ratio_ts(p) = sum((y_ft_abs1s_test).^2)/sum((y_ft_abs2s_test).^2);

     y_test_filter1t = filter(num_1, den_1, ytestt);
    y_testft1t = fft(y_test_filter1t,l2);
    y_ft_abs1t_test = abs(y_testft1t);
    
     y_test_filter2t = filter(num_2, den_2, ytestt);
     y_testft2t = fft(y_test_filter2t,l2);
     y_ft_abs2t_test = abs(y_testft2t);  
      
      
     ratio_tt(p) = sum((y_ft_abs1t_test).^2)/sum((y_ft_abs2t_test).^2);
     

      if ratio_ts(p) > 95
%          cout = cout+1;
          disp('sinhala')
      else
          disp('tamil')
        
         
       
      end  

end

% disp(cout)
zt =zeros(length(d),1);
figure;
scatter(ratio_ts,zt,'b');
hold on;
scatter(ratio_tt,zt,'r');
xlim([0,2000])


