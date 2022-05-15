%testing
clear all
close all
%giving the directory

d = dir('C:\Users\Udara\Desktop\DSP task 3\testing\testr\*.wav');
%initilaizing the filters

[b1,a1] = butter(8,[100,500]/(8000/2),'bandpass');
        
[b2,a2] = butter(5,[1200,2000]/(8000/2),'bandpass');

[b3,a3] = butter(7,[800,1000]/(8000/2),'bandpass');

count =0;
correct = 0;
for q=1:length(d)
    temp=d(q).name;
    r = 1:length(d);
    [s,fs]=audioread(['C:\Users\Udara\Desktop\DSP task 3\testing\testr\',temp]);
    
    s1=filter(b1,a1,s);
    s2=filter(b2,a2,s);
    s3=filter(b3,a3,s); 
    
    ratio1(q)=sum(abs(s1).^2)/sum(abs(s2).^2);
    ratio2(q)=sum(abs(s1).^2)/sum(abs(s3).^2);
    ratio3(q)=sum(abs(s2).^2)/sum(abs(s3).^2);
    
    disp(d(q).name)
    if and(ratio2(q)>375,ratio3(q)>3.75)%sinhala
        if or(strcmp(temp(6),'S'),strcmp(temp(6),'s'))%correct count
            disp('1')
            correct = correct +1;
        else
            disp('0')
        end
    elseif and(ratio1(q)>240,ratio1(q)<700)
        if or(strcmp(temp(6),'T'),strcmp(temp(6),'t'))
            disp('1')
            correct = correct +1;
        else
            disp('0')
        end
        
    else  
        if or(strcmp(temp(6),'T'),strcmp(temp(6),'t')) 
            disp('1')
            correct = correct +1;
            
        else
           disp('0')
        end
        
    end
    count = count+1;
end

acc = correct*100/count 

