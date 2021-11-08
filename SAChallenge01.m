function SAChallenge01() 
try 
    Screen('Preference', 'SkipSyncTests', 1); 
    mpos = get(0,'MonitorPositions');
    DisableKeysForKbCheck([232:256]); 
    [w, wr]=Screen('OpenWindow',0 , 255 ,[0 0 mpos(3) mpos(4)], 32, 2); 
    Screen('TextFont', w, '-:lang=ja');
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    rupe=0;
    %↓文字の繰り返し回数
    cou=10;
    %↓文字の画面左端からの距離
    rig=400;
    s_r=rig;
    %↓文字の画面上端からの距離
    top=20;
    s_t=top;
    %%%%%%%%%%%%文字が大きかったら、下のwr(4)/60の60を小さい数字に変える、文字が小さい場合は大きく
    f_siz=round(wr(3)/(cou+round(wr(4)/60)));
   %ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー%
   %↓文字部分、m1ってやつが多い文字。s1ってやつが探す文字
    m1='缶';
    s1='連'; 
   %%%%%%%%%%%%%%%
    rs=randi([1,cou]);
    gs=randi([1,cou]);
    Screen('TextSize', w, f_siz);
        for r=1:cou
        for g=1:cou
            
            if r==rs&&g==gs
                mytext=double(s1);
            else
                mytext=double(m1);
            end
        [ex, ey]=Screen('DrawText', w, mytext, rig, top);
        tb=Screen('TextBounds', w, mytext); 
        rig=(tb(3)*g+5*g)+s_r;
        end
    rig=s_r;%%%%%%
    top=tb(4)*r+s_t;
    end
    Screen('Flip',w);
    imageArray = Screen('GetImage', w );
    imwrite(imageArray,'out.png') ;
 while rupe==0
             [press, ~, key]=KbCheck();
             if press
                      if max(find(key)==KbName('space'))==1
                           rupe=1;
                      else 
                           rupe=0;
                      end 
             else
             end
        end
       Screen('CloseAll'); 
catch 
    Screen('CloseAll'); 
    psychrethrow(psychlasterror); 
end 
end