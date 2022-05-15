%filtering
clear all
close all

%Initializing the butterworth filters
[b1,a1] = butter(6,[100,500]/(8000/2),'bandpass');
        
[b2,a2] = butter(6,[1200,2000]/(8000/2),'bandpass');

[b3,a3] = butter(6,[800,1000]/(8000/2),'bandpass');

%filtering each values

%Giving the resource directories
sin=dir('C:\Users\Udara\Desktop\DSP task 3\training\Rsinhala\*.wav');
tam=dir('C:\Users\Udara\Desktop\DSP task 3\training\Rtamil\*.wav'); 


for q=1:length(sin)
    temp1=sin(q).name;
    temp2=tam(q).name;
    
    [s_sinhala,fs1]=audioread(['C:\Users\Udara\Desktop\DSP task 3\training\Rsinhala\',temp1]);
    [s_tamil,fs2]=audioread(['C:\Users\Udara\Desktop\DSP task 3\training\Rtamil\',temp2]);
    
    
    s1=filter(b1,a1,s_sinhala);
    s2=filter(b2,a2,s_sinhala);
    s3=filter(b3,a3,s_sinhala); 
    %taking energy ratios
    ratio1(q)=sum(abs(s1).^2)/sum(abs(s2).^2);
    ratio2(q)=sum(abs(s1).^2)/sum(abs(s3).^2);
    ratio3(q)=sum(abs(s2).^2)/sum(abs(s3).^2);
    s1t=filter(b1,a1,s_tamil);
    s2t=filter(b2,a2,s_tamil);
    s3t=filter(b3,a3,s_tamil);
    %taking energy ratios
    ratio1t(q)=sum(abs(s1t).^2)/sum(abs(s2t).^2);
    ratio2t(q)=sum(abs(s1t).^2)/sum(abs(s3t).^2);
    ratio3t(q)=sum(abs(s2t).^2)/sum(abs(s3t).^2);
   
   
    
   
    
    

    
    
end
 %plotting the scatter plots for each ratios
%     figure(1)
%     scatter(ratio1,zeros(length(ratio1),1),'r');%sinhala
%     hold on 
%     scatter(ratio1t,zeros(length(ratio1t),1),'g')%tamil
%     hold off
%     figure(2)
%     scatter(ratio2,zeros(length(ratio2),1),'b');%sinhala
%     hold on 
%     scatter(ratio2t,zeros(length(ratio2t),1),'g');%tamil
%     hold off
%     figure(3)
%     scatter(ratio3,zeros(length(ratio3),1),'r');%sinhala
%     hold on 
%     scatter(ratio3t,zeros(length(ratio3t),1),'b');%tamil


%finding the averages and standarad daviations for ratio values for
%thresold arguments finding
%ratio1-sinhala
av = mean(ratio1);%109
std = sqrt(var(ratio1));%127
%ratio1-tamil
av = mean(ratio1t);%219
std = sqrt(var(ratio1t));%448


%ratio2-sinhala
av = mean(ratio2);%1.0293e+03
std = sqrt(var(ratio2));%1.9175e+03
%ratio2-tamil
av = mean(ratio2t);%200
std = sqrt(var(ratio2t));%292


%ratio3-sinhala
av = mean(ratio3);%10.1182
std = sqrt(var(ratio3));%15.1616
%ratio3-tamil
av = mean(ratio3t);%1.9635
std = sqrt(var(ratio3t));%2.1234



