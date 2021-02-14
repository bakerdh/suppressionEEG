

datadir = '/Users/danbaker/Desktop/SurroundEEG/low/';
d = dir(datadir);
for s = 4:length(d)
    tic
s-3
   d_EEG2CSV(strcat(datadir, d(s).name ,'/'))
    toc
end
   tic
for s = 4:length(d)
 
   EEGpath = strcat(datadir, d(s).name ,'/');
   
   d2 = dir(EEGpath);       % index the directory containing the EEG files
counter = 0;
for n = 1:length(d2)
    temp = d2(n).name;
    if length(temp)>3
        if temp(end-2:end)=='.gz'       % find each file in gz format
            counter = counter + 1;
            namelist{counter} = temp;   % create a list of gz filenames
        end
    end
end

   outpath = (strcat('~/Desktop/SurroundEEG/S', num2str(s-3),'low/'));
mkdir(outpath);
for f = 1:counter
    movefile(strcat(EEGpath,namelist{f}),strcat(outpath,namelist{f}));
end
   
end


datadir = '/Users/danbaker/Desktop/SurroundEEG/high/';
d = dir(datadir);
for s = 4:length(d)
    tic
s-3
   d_EEG2CSV(strcat(datadir, d(s).name ,'/'))
    toc
end
   tic
for s = 4:length(d)
 
   EEGpath = strcat(datadir, d(s).name ,'/');
   
   d2 = dir(EEGpath);       % index the directory containing the EEG files
counter = 0;
for n = 1:length(d2)
    temp = d2(n).name;
    if length(temp)>3
        if temp(end-2:end)=='.gz'       % find each file in gz format
            counter = counter + 1;
            namelist{counter} = temp;   % create a list of gz filenames
        end
    end
end

   outpath = (strcat('~/Desktop/SurroundEEG/S', num2str(s-3),'high/'));
mkdir(outpath);
for f = 1:counter
    movefile(strcat(EEGpath,namelist{f}),strcat(outpath,namelist{f}));
end
   
end
 toc
