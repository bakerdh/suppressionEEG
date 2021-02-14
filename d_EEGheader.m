function d_EEGheader

% function to create a generic meta-data file for an EEG experiment
% contains electrode positions and trigger explanations
% can contain other useful study information
% DHB 30/9/18

load Waveguard.mat;
    outputfile = 'headerfileLow.csv';  % generate a filename for the output based on the original filename
    fid = fopen(outputfile,'w');                        % open the output file


    detailvect1{1} = 'SSVEP surround suppression (low)';
    detailvect2{1} = '2014';
    detailvect1{2} = 'Sample rate';
    detailvect2{2} = '1000Hz';    
    detailvect1{3} = 'Stimulus duration';
    detailvect2{3} = '11s';
    detailvect1{4} = 'Target frequency';
    detailvect2{4} = '5Hz';
    detailvect1{5} = 'Target frequency';
    detailvect2{5} = '5Hz';
    detailvect1{6} = 'Repetitions per condition';
    detailvect2{6} = '6';
    detailvect1{7} = 'Trials per block';
    detailvect2{7} = '42';
    detailvect1{8} = 'Total participants';
    detailvect2{8} = '12';
    detailvect1{9} = 'Number of electrodes';
    detailvect2{9} = '64';
    detailvect1{10} = 'Montage layout';
    detailvect2{10} = '5 percent';
    detailvect1{11} = 'EEG system';
    detailvect2{11} = 'ANT Neuroscan';
    detailvect1{12} = 'Original file format';
    detailvect2{12} = 'ANT EEprobe .cnt files';
    
    triggervect = [11:16 21:29 31:39 41:49 51:59];
    triggerinfo{1} = 'Target 0; No mask';
    triggerinfo{2} = 'Target 6; No mask';
    triggerinfo{3} = 'Target 12; No mask';
    triggerinfo{4} = 'Target 24; No mask';
    triggerinfo{5} = 'Target 48; No mask';
    triggerinfo{6} = 'Target 96; No mask';
    triggerinfo{7} = 'Target 6; Monocular mask 12';
    triggerinfo{8} = 'Target 12; Monocular mask 12';
    triggerinfo{9} = 'Target 24; Monocular mask 12';
    triggerinfo{10} = 'Target 48; Monocular mask 12';
    triggerinfo{11} = 'Target 88; Monocular mask 12';
    triggerinfo{12} = 'Target 24; Monocular mask 6';
    triggerinfo{13} = 'Target 24; Monocular mask 24';
    triggerinfo{14} = 'Target 24; Monocular mask 48';
    triggerinfo{15} = 'Target 24; Monocular mask 68';
    triggerinfo{16} = 'Target 6; Dichoptic mask 12';
    triggerinfo{17} = 'Target 12; Dichoptic mask 12';
    triggerinfo{18} = 'Target 24; Dichoptic mask 12';
    triggerinfo{19} = 'Target 48; Dichoptic mask 12';
    triggerinfo{20} = 'Target 96; Dichoptic mask 12';
    triggerinfo{21} = 'Target 24; Dichoptic mask 6';
    triggerinfo{22} = 'Target 24; Dichoptic mask 24';
    triggerinfo{23} = 'Target 24; Dichoptic mask 48';
    triggerinfo{24} = 'Target 24; Dichoptic mask 96';
    triggerinfo{25} = 'Target 6; Aligned surround 12';
    triggerinfo{26} = 'Target 12; Aligned surround 12';
    triggerinfo{27} = 'Target 24; Aligned surround 12';
    triggerinfo{28} = 'Target 48; Aligned surround 12';
    triggerinfo{29} = 'Target 96; Aligned surround 12';
    triggerinfo{30} = 'Target 24; Aligned surround 6';
    triggerinfo{31} = 'Target 24; Aligned surround 24';
    triggerinfo{32} = 'Target 24; Aligned surround 48';
    triggerinfo{33} = 'Target 24; Aligned surround 96';
    triggerinfo{34} = 'Target 6; Orthogonal surround 12';
    triggerinfo{35} = 'Target 12; Orthogonal surround 12';
    triggerinfo{36} = 'Target 24; Orthogonal surround 12';
    triggerinfo{37} = 'Target 48; Orthogonal surround 12';
    triggerinfo{38} = 'Target 96; Orthogonal surround 12';
    triggerinfo{39} = 'Target 24; Orthogonal surround 6';
    triggerinfo{40} = 'Target 24; Orthogonal surround 24';
    triggerinfo{41} = 'Target 24; Orthogonal surround 48';
    triggerinfo{42} = 'Target 24; Orthogonal surround 96';
               
    plist = [1:12];
    fprintf(fid,'Details1,Details2,Trigger,Description,ParticipantIDs,Electrode,X_position,Y_position,OutlineX,OutlineY,NoseX,NoseY,LearX,LearY,RearX,RearY\n');
 
 for n = 1:101
     
     if n<=length(detailvect1)
        detailstring1 = detailvect1{n};
     else
         detailstring1 = '';
     end
     if n<=length(detailvect2)
        detailstring2 = detailvect2{n};
     else
         detailstring2 = '';
     end     
     if n<=length(triggervect)
        t = num2str(triggervect(n));
     else
         t = '';
     end   
     if n<=length(triggerinfo)
        triggerstring = triggerinfo{n};
     else
         triggerstring = '';
     end     
     if n<=length(plist)
         s = num2str(plist(n));
%          while length(s)<2
%              s = strcat('0',s);
%          end
        pID = strcat('S',s);
     else
         pID = '';
     end    
     
     if n<=length(lay.label)
       electrodelabel = lay.label{n};
       x = num2str(lay.pos(n,1),'%2.4f');
       y = num2str(lay.pos(n,2),'%2.4f');
     else
       electrodelabel = '';
       x = '';
       y = '';
     end
     
         xhead = num2str(lay.outline{1,1}(n,1),'%2.4f');
         yhead = num2str(lay.outline{1,1}(n,2),'%2.4f');
         
     if n<=length(lay.outline{1,2})
         xnose = num2str(lay.outline{1,2}(n,1),'%2.4f');
         ynose = num2str(lay.outline{1,2}(n,2),'%2.4f');
     else
       xnose = '';
       ynose = '';
     end
     if n<=length(lay.outline{1,4})
         xLear = num2str(lay.outline{1,4}(n,1),'%2.4f');
         yLear = num2str(lay.outline{1,4}(n,2),'%2.4f');
     else
       xLear = '';
       yLear = '';
     end
     if n<=length(lay.outline{1,3})
         xRear = num2str(lay.outline{1,3}(n,1),'%2.4f');
         yRear = num2str(lay.outline{1,3}(n,2),'%2.4f');
     else
       xRear = '';
       yRear = '';
     end
     
fprintf(fid,strcat(detailstring1,',',detailstring2,',',t,',',triggerstring,',',pID,',',electrodelabel,',',x,',',y,',',xhead,',',yhead,',',xnose,',',ynose,',',xLear,',',yLear,',',xRear,',',yRear,'\n'));    % export this row of data to the text file

 end
 fclose(fid); 
 
 
 
 
     outputfile = 'headerfileHi.csv';  % generate a filename for the output based on the original filename
    fid = fopen(outputfile,'w');                        % open the output file


    detailvect1{1} = 'SSVEP surround suppression (high)';
    detailvect2{1} = '2014';
    detailvect1{2} = 'Sample rate';
    detailvect2{2} = '1000Hz';    
    detailvect1{3} = 'Stimulus duration';
    detailvect2{3} = '11s';
    detailvect1{4} = 'Target frequency';
    detailvect2{4} = '5Hz';
    detailvect1{5} = 'Target frequency';
    detailvect2{5} = '5Hz';
    detailvect1{6} = 'Repetitions per condition';
    detailvect2{6} = '6';
    detailvect1{7} = 'Trials per block';
    detailvect2{7} = '42';
    detailvect1{8} = 'Total participants';
    detailvect2{8} = '12';
    detailvect1{9} = 'Number of electrodes';
    detailvect2{9} = '64';
    detailvect1{10} = 'Montage layout';
    detailvect2{10} = '5 percent';
    detailvect1{11} = 'EEG system';
    detailvect2{11} = 'ANT Neuroscan';
    detailvect1{12} = 'Original file format';
    detailvect2{12} = 'ANT EEprobe .cnt files';
    
    triggervect = [11:16 21:29 31:39 41:49 51:59];
    triggerinfo{1} = 'Target 0; No mask';
    triggerinfo{2} = 'Target 6; No mask';
    triggerinfo{3} = 'Target 12; No mask';
    triggerinfo{4} = 'Target 24; No mask';
    triggerinfo{5} = 'Target 48; No mask';
    triggerinfo{6} = 'Target 96; No mask';
    triggerinfo{7} = 'Target 6; Monocular mask 24';
    triggerinfo{8} = 'Target 12; Monocular mask 24';
    triggerinfo{9} = 'Target 24; Monocular mask 24';
    triggerinfo{10} = 'Target 48; Monocular mask 24';
    triggerinfo{11} = 'Target 68; Monocular mask 24';
    triggerinfo{12} = 'Target 24; Monocular mask 6';
    triggerinfo{13} = 'Target 24; Monocular mask 12';
    triggerinfo{14} = 'Target 24; Monocular mask 48';
    triggerinfo{15} = 'Target 24; Monocular mask 68';
    triggerinfo{16} = 'Target 6; Dichoptic mask 24';
    triggerinfo{17} = 'Target 12; Dichoptic mask 24';
    triggerinfo{18} = 'Target 24; Dichoptic mask 24';
    triggerinfo{19} = 'Target 48; Dichoptic mask 24';
    triggerinfo{20} = 'Target 96; Dichoptic mask 24';
    triggerinfo{21} = 'Target 24; Dichoptic mask 6';
    triggerinfo{22} = 'Target 24; Dichoptic mask 12';
    triggerinfo{23} = 'Target 24; Dichoptic mask 48';
    triggerinfo{24} = 'Target 24; Dichoptic mask 96';
    triggerinfo{25} = 'Target 6; Aligned surround 24';
    triggerinfo{26} = 'Target 12; Aligned surround 24';
    triggerinfo{27} = 'Target 24; Aligned surround 24';
    triggerinfo{28} = 'Target 48; Aligned surround 24';
    triggerinfo{29} = 'Target 96; Aligned surround 24';
    triggerinfo{30} = 'Target 24; Aligned surround 6';
    triggerinfo{31} = 'Target 24; Aligned surround 12';
    triggerinfo{32} = 'Target 24; Aligned surround 48';
    triggerinfo{33} = 'Target 24; Aligned surround 96';
    triggerinfo{34} = 'Target 6; Orthogonal surround 24';
    triggerinfo{35} = 'Target 12; Orthogonal surround 24';
    triggerinfo{36} = 'Target 24; Orthogonal surround 24';
    triggerinfo{37} = 'Target 48; Orthogonal surround 24';
    triggerinfo{38} = 'Target 96; Orthogonal surround 24';
    triggerinfo{39} = 'Target 24; Orthogonal surround 6';
    triggerinfo{40} = 'Target 24; Orthogonal surround 12';
    triggerinfo{41} = 'Target 24; Orthogonal surround 48';
    triggerinfo{42} = 'Target 24; Orthogonal surround 96';
               
    plist = [1:12];
    fprintf(fid,'Details1,Details2,Trigger,Description,ParticipantIDs,Electrode,X_position,Y_position,OutlineX,OutlineY,NoseX,NoseY,LearX,LearY,RearX,RearY\n');
 
 for n = 1:101
     
     if n<=length(detailvect1)
        detailstring1 = detailvect1{n};
     else
         detailstring1 = '';
     end
     if n<=length(detailvect2)
        detailstring2 = detailvect2{n};
     else
         detailstring2 = '';
     end     
     if n<=length(triggervect)
        t = num2str(triggervect(n));
     else
         t = '';
     end   
     if n<=length(triggerinfo)
        triggerstring = triggerinfo{n};
     else
         triggerstring = '';
     end     
     if n<=length(plist)
         s = num2str(plist(n));
%          while length(s)<2
%              s = strcat('0',s);
%          end
        pID = strcat('S',s);
     else
         pID = '';
     end    
     
     if n<=length(lay.label)
       electrodelabel = lay.label{n};
       x = num2str(lay.pos(n,1),'%2.4f');
       y = num2str(lay.pos(n,2),'%2.4f');
     else
       electrodelabel = '';
       x = '';
       y = '';
     end
     
         xhead = num2str(lay.outline{1,1}(n,1),'%2.4f');
         yhead = num2str(lay.outline{1,1}(n,2),'%2.4f');
         
     if n<=length(lay.outline{1,2})
         xnose = num2str(lay.outline{1,2}(n,1),'%2.4f');
         ynose = num2str(lay.outline{1,2}(n,2),'%2.4f');
     else
       xnose = '';
       ynose = '';
     end
     if n<=length(lay.outline{1,4})
         xLear = num2str(lay.outline{1,4}(n,1),'%2.4f');
         yLear = num2str(lay.outline{1,4}(n,2),'%2.4f');
     else
       xLear = '';
       yLear = '';
     end
     if n<=length(lay.outline{1,3})
         xRear = num2str(lay.outline{1,3}(n,1),'%2.4f');
         yRear = num2str(lay.outline{1,3}(n,2),'%2.4f');
     else
       xRear = '';
       yRear = '';
     end
     
fprintf(fid,strcat(detailstring1,',',detailstring2,',',t,',',triggerstring,',',pID,',',electrodelabel,',',x,',',y,',',xhead,',',yhead,',',xnose,',',ynose,',',xLear,',',yLear,',',xRear,',',yRear,'\n'));    % export this row of data to the text file

 end
 fclose(fid); 
 
end