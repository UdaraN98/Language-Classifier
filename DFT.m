clear all
close all
xt=1;
xs=1;

%Giving the resource directories
sin=dir('C:\Users\Udara\Desktop\DSP task 3\training\Rsinhala\*.wav');
tam=dir('C:\Users\Udara\Desktop\DSP task 3\training\Rtamil\*.wav'); 
%plotting graphs for all 65 training examples
for q=1:length(sin)
    temp1=sin(q).name;
    temp2=tam(q).name;
    [s_sinhala,fs1]=audioread(['C:\Users\Udara\Desktop\DSP task 3\training\Rsinhala\',temp1]);
    [s_tamil,fs2]=audioread(['C:\Users\Udara\Desktop\DSP task 3\training\Rtamil\',temp2]);
    fftab1=abs(fft(s_sinhala));
    ll=length(fftab1);
    fftab2=abs(fft(s_tamil));
    l2=length(fftab2);
    figure (1)
    subplot(5,13,xs)
    plot((0:ll/2-1)*fs1/ll,fftab1(1:ll/2),'r')%Red for sinhala
    xs=xs+1;
    hold on
    subplot(5,13,xt)
    plot((0:l2/2-1)*fs2/l2,fftab2(1:l2/2),'b')%Blue for tamil
    xt=xt+1;
    
  
    
end
disp('done')
