function test2() 
try 
    Screen('Preference', 'SkipSyncTests', 1); 
    DisableKeysForKbCheck([232:256]); 
    [w, wr]=Screen('OpenWindow',0 , 255 ,[], 32, 2); 
    Screen('TextFont', w, '-:lang=ja');
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    progrom1(wr, w, cou, rig, s_r, top, s_t, f_siz);
    progrom2(wr, w, cou, rig, s_r, top, s_t, f_siz);
    progrom3(wr, w, cou, rig, s_r, top, s_t, f_siz);
    progrom4(wr, w, cou, rig, s_r, top, s_t, f_siz);
    progrom5(wr, w, cou, rig, s_r, top, s_t, f_siz);
    progrom6(wr, w, cou, rig, s_r, top, s_t, f_siz);
    progrom7(wr, w, cou, rig, s_r, top, s_t, f_siz);
   Screen('CloseAll'); 
catch 
    Screen('CloseAll'); 
    psychrethrow(psychlasterror); 
end 
end
%呈示する文字を変える場合は下の
function progrom1(wr, w, cou, rig, s_r, top, s_t, f_siz) 
    %%%%%%%%%%%%%%%%  
    m1='缶';
    s1='連'; 
    rs=randi([1,cou]);
    gs=randi([1,cou]);
    Screen('TextSize', w, f_siz);
    %%%%%%%%%%%%%%%%%%
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
    KbWait([], 3);
end
function progrom2(wr, w, cou, rig, s_r, top, s_t, f_siz) 
    %%%%%%%%%%%%%%%%  
    m1='案';
    s1='新'; 
    rs=randi([1,cou]);
    gs=randi([1,cou]);
    Screen('TextSize', w, f_siz);
    %%%%%%%%%%%%%%%%%%
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
    KbWait([], 3);
end
function progrom3(wr, w, cou, rig, s_r, top, s_t, f_siz) 
    %%%%%%%%%%%%%%%%  
    m1='猫';
    s1='犬'; 
    rs=randi([1,cou]);
    gs=randi([1,cou]);
    Screen('TextSize', w, f_siz);
    %%%%%%%%%%%%%%%%%%
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
    KbWait([], 3);
end
function progrom4(wr, w, cou, rig, s_r, top, s_t, f_siz) 
    %%%%%%%%%%%%%%%%  
    m1='満';
    s1='心'; 
    rs=randi([1,cou]);
    gs=randi([1,cou]);
    Screen('TextSize', w, f_siz);
    %%%%%%%%%%%%%%%%%%
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
    KbWait([], 3);
end
function progrom5(wr, w, cou, rig, s_r, top, s_t, f_siz) 
    %%%%%%%%%%%%%%%%  
    m1='荒';
    s1='田'; 
    rs=randi([1,cou]);
    gs=randi([1,cou]);
    Screen('TextSize', w, f_siz);
    %%%%%%%%%%%%%%%%%%
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
    KbWait([], 3);
end
function progrom6(wr, w, cou, rig, s_r, top, s_t, f_siz) 
    %%%%%%%%%%%%%%%%  
    m1='石';
    s1='坂'; 
    rs=randi([1,cou]);
    gs=randi([1,cou]);
    Screen('TextSize', w, f_siz);
    %%%%%%%%%%%%%%%%%%
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
    KbWait([], 3);
end
function progrom7(wr, w, cou, rig, s_r, top, s_t, f_siz) 
    %%%%%%%%%%%%%%%%  
    m1='眞';
    s1='田'; 
    rs=randi([1,cou]);
    gs=randi([1,cou]);
    Screen('TextSize', w, f_siz);
    %%%%%%%%%%%%%%%%%%
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
    KbWait([], 3);
end