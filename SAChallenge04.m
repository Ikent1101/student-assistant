function SAChallenge04() 
try
    Screen('Preference', 'SkipSyncTests', 1);
    DisableKeysForKbCheck(232:256);
    myKeyCheck;
    ListenChar(2);
    KbName('UnifyKeyNames');
    [w, wr]=Screen('OpenWindow', 0, 255 ,[], 32, 2);
    hx=wr(3)/2;
    hy=wr(4)/2;
    blue=[172 234 255];
    pink=[249 176 249];
    squ=wr(4)*0.25*(1/sqrt(2));
    trial=60;       %試行回数
    Wit=randperm(trial);
    Screen('TextSize', w, 60);
    Screen('TextFont', w, '-:lang=ja');
    fn=datestr(now, 'yymmddhhMMss');
    fw=fopen([fn 'fy06.csv'],'w');
    fprintf(fw,'%s,%s,%s,%s,%s,%s,%s\n', "ID", "形","数字", "正誤", "反応時間","設定時間","押下キー");
    inst=double('準備ができたらスペースキーを押してください');
    tb=Screen('TextBounds', w, inst);
    Screen('DrawText', w, inst, hx-tb(3)/2, hy-tb(4)/2);
    Screen('Flip',w);
    KbWait([],3);
    for trl=1:trial
        Screen('FillOval', w, 0, [hx-5 hy-hy*0.4-5 hx+5 hy-hy*0.4+5]);
     [cho,Wtime]=katachi_to_zikan(w,trl,hx,hy,squ,Wit,pink,blue);
        numb=randi([1,9]);
        Screen('TextSize', w, wr(4)*0.1);
        tb=Screen('TextBounds', w, num2str(numb));
        Screen('DrawText', w, num2str(numb), hx-tb(3)/2, hy-tb(4)/2);
        Screen('Flip',w);
        st=GetSecs;
     [press,cor,en,keys]=pushKeyName(cho,numb);
        fprintf(fw,'%d,%s,%d,%s,%f,%f,%s\n', trl, cho, numb, cor, en-st, Wtime, KbName(keys));
        while press
            [press, ~, ~]=KbCheck;
        end
    end
    Screen('TextSize', w, 60);
    inst=double('ご協力ありがとうございました');
    tb=Screen('TextBounds', w, inst);
    Screen('DrawText', w, inst, hx-tb(3)/2, hy-tb(4)/2);
    Screen('Flip', w);
    WaitSecs(0.5);
    fclose(fw);
    ListenChar(0);
    Screen('CloseAll');
catch
    ListenChar(0);
    Screen('CloseAll');
    psychrethrow(psychlasterror);
end
end

function myKeyCheck

KbName('UnifyKeyNames');
tic;
while toc < 1; end
DisableKeysForKbCheck([]);
[ keyIsDown, ~, keyCode ] = KbCheck;
if keyIsDown
    fprintf('無効にしたキーがあります\n');
    keys=find(keyCode); % keyCodeの表示
    KbName(keys) % キーの名前を表示
    DisableKeysForKbCheck(keys);
end
end

function cho=square(w,hx,hy, blue,pink)
color=randi([1,2]);
if color==1
    gra=blue;
else
    gra=pink;
end
Screen('FillRect', w, gra, [hx-hy*0.2 hy-hy*0.2 hx+hy*0.2 hy+hy*0.2]);
Screen('FrameRect', w, 0, [hx-hy*0.2 hy-hy*0.2 hx+hy*0.2 hy+hy*0.2],5);
cho="square";
end

function cho=diamond(w,hx,hy,blue,pink)
color=randi([1,2]);
dia_h=hy*0.4*0.5*sqrt(2);
poi=[hx hy+dia_h; hx+dia_h hy; hx hy-dia_h; hx-dia_h hy];
if color==1
    gra=blue;
else
    gra=pink;
end
Screen('FillPoly', w, gra, poi);
Screen('FramePoly', w, 0, poi,5);
cho="diamond";
end

function [cho,Wtime]=katachi_to_zikan(w,trl,hx,hy,squ,Wit,blue,pink)
trle=trl-1;
if rem(trle,4)==0
    Screen('DrawLine', w, 0, hx, hy, hx+squ, hy-squ, 5);
    if rem(fix(trle/4),2)==0
        cho=diamond(w,hx,hy,blue,pink);
    elseif rem(fix(trle/4),2)==1
        cho=square(w,hx,hy,blue,pink);
    end
    Screen('Flip',w,0,1);
    if Wit(trl)<=20
        Wtime=0.05;
        WaitSecs(Wtime);
    elseif Wit(trl)<=40
        Wtime=0.65;
        WaitSecs(Wtime);
    elseif Wit(trl)<=60
        Wtime=1.25;
        WaitSecs(Wtime);
    end
    
elseif rem(trle,4)==1
    Screen('DrawLine', w, 0, hx, hy, hx+squ, hy+squ, 5);
    if rem(fix(trle/4),2)==0
        cho=diamond(w,hx,hy,blue,pink);
    elseif rem(fix(trle/4),2)==1
        cho=square(w,hx,hy,blue,pink);
    end
    Screen('Flip',w,0,1);
    if Wit(trl)<=20
        if Wit(trl)<=10
            Wtime=0.65;
            WaitSecs(Wtime);
        else
            Wtime=1.25;
            WaitSecs(Wtime);
        end
    elseif Wit(trl)<=40
        if Wit(trl)<=30
            Wtime=0.05;
            WaitSecs(Wtime);
        else
            Wtime=1.25;
            WaitSecs(Wtime);
        end
    elseif Wit(trl)<=60
        if Wit(trl)<=50
            Wtime=0.05;
            WaitSecs(Wtime);
        else
            Wtime=0.65;
            WaitSecs(Wtime);
        end
    end
elseif rem(trle,4)==2
    Screen('DrawLine', w, 0, hx, hy, hx-squ, hy+squ, 5);
    if rem(fix(trle/4),2)==0
        cho=diamond(w,hx,hy,blue,pink);
    elseif rem(fix(trle/4),2)==1
        cho=square(w,hx,hy,blue,pink);
    end
    
    Screen('Flip',w,0,1);
    if Wit(trl)<=20
        if Wit(trl)<=10
            Wtime=1.25;
            WaitSecs(Wtime);
        else
            Wtime=0.65;
            WaitSecs(Wtime);
        end
    elseif Wit(trl)<=40
        if Wit(trl)<=30
            Wtime=1.25;
            WaitSecs(Wtime);
        else
            Wtime=0.05;
            WaitSecs(Wtime);
        end
    elseif Wit(trl)<=60
        if Wit(trl)<=50
            Wtime=0.65;
            WaitSecs(Wtime);
        else
            Wtime=0.05;
            WaitSecs(Wtime);
        end
    end
    
    
elseif rem(trle,4)==3
    Screen('DrawLine', w, 0, hx, hy, hx-squ, hy-squ, 5);
    if rem(fix(trle/4),2)==0
        cho=diamond(w,hx,hy,blue,pink);
    elseif rem(fix(trle/4),2)==1
        cho=square(w,hx,hy,blue,pink);
    end
    Screen('Flip',w,0,1);
    ra=randi([1,3]);
    if ra==1
        Wtime=0.05;
        WaitSecs(Wtime);
    elseif ra==2
        Wtime=0.65;
        WaitSecs(Wtime);
    else
        Wtime=1.25;
        WaitSecs(Wtime);
    end
end
end

function [press,cor,en,keys]=pushKeyName(cho,numb)
while 1
    [press, ~, keys]=KbCheck;
    if find(keys)==KbName('f') | find(keys)==KbName('j')
        en=GetSecs;
        if strcmp(cho,"diamond")==1
            if numb<=5
                if find(keys)==KbName('f')
                    cor="correct";
                    break;
                elseif find(keys)==KbName('j')
                    cor="faild";
                    break;
                end
            elseif numb<=9
                if find(keys)==KbName('f')
                    cor="faild";
                    break;
                elseif find(keys)==KbName('j')
                    cor="correct";
                    break;
                end
            end
            
        elseif strcmp(cho,"square")==1
            if rem(numb,2)==0
                if find(keys)==KbName('j')
                    cor="correct";
                    break;
                elseif find(keys)==KbName('f')
                    cor="faild";
                    break;
                end
            elseif rem(numb,2)==1
                if find(keys)==KbName('j')
                    cor="faild";
                    break;
                elseif find(keys)==KbName('f')
                    cor="correct";
                    break;
                end
            end
        else
        end
    else
    end
end
end