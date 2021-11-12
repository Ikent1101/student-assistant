function SAChallenge02() 
try 
Screen('Preference', 'SkipSyncTests', 1); 
DisableKeysForKbCheck(232:256); 
[w, wr]=Screen('OpenWindow',0 , 255 ,[0 0 1000 1000], 32, 2);
siz=5;
sp=1;
ka=sp;
po=wr(3)/(360/sp);
while 1
    [press]=KbCheck();
for e=0:(360/sp)
    ypo=wr(4)/2+200*sin((e+ka)*sp*pi/180);
    Screen('FillOval', w, [0 0 200], [e*po-siz ypo-siz e*po+siz ypo+siz]);
end
for e=0:(360/sp)
    ypo=wr(4)/2+200*sin((e+ka*1.5)*sp*pi/180);
    Screen('FillOval', w, [0 240 255], [e*po-siz ypo-siz e*po+siz ypo+siz]);
end
for e=0:(360/sp)
    ypo=wr(4)/2+200*sin((e+ka*2)*sp*pi/180);
    Screen('FillOval', w, [81 177 255], [e*po-siz ypo-siz e*po+siz ypo+siz]);
end
if press
    break;
end
Screen('Flip',w);
ka=ka+sp;
end
 Screen('CloseAll');
catch
 Screen('CloseAll');
 psychrethrow(psychlasterror);
end