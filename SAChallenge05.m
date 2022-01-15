function SAChallenge05()
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
    trial=72;       %試行回数
    tral=trial/4;
    choicecoun=randperm(tral);
    Wit=randperm(tral);
    countin=1;
    color=1;
    kirikae=randi([0,1]);
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
    for trl=1:tral
        kirikae=kirikae+1;
        if choicecoun(countin)<=6
            [countin]=thirdcount(kirikae,w,hx,hy,blue,pink,color,Wit,countin,wr,fw);
        elseif choicecoun <= 12
            [countin]=fourcount(kirikae,w,hx,hy,blue,pink,color,Wit,countin,wr,fw);
        elseif choicecoun <= 18
            [countin]=fivecount(kirikae,w,hx,hy,blue,pink,color,Wit,countin,wr,fw);
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

function [cho,color]=square(w,hx,hy, blue,pink,color)
if rem(color,2)==1
    gra=blue;
else
    gra=pink;
end
Screen('FillRect', w, gra, [hx-hy*0.2 hy-hy*0.2 hx+hy*0.2 hy+hy*0.2]);
Screen('FrameRect', w, 0, [hx-hy*0.2 hy-hy*0.2 hx+hy*0.2 hy+hy*0.2],5);
cho="square";
Screen('Flip',w,0,1);
color=color+1;
end

function [cho,color]=diamond(w,hx,hy, blue,pink,color)
dia_h=hy*0.4*0.5*sqrt(2);
poi=[hx hy+dia_h; hx+dia_h hy; hx hy-dia_h; hx-dia_h hy];
if rem(color,2)==1
    gra=blue;
else
    gra=pink;
end
Screen('FillPoly', w, gra, poi);
Screen('FramePoly', w, 0, poi,5);
cho="diamond";
Screen('Flip',w,0,1);
color=color+1;
end

function [countin]=thirdcount(kirikae,w,hx,hy,blue,pink,color,Wit,countin,wr,fw)
for e=1:3
    if rem(kirikae,2)==0
        [cho,color]=diamond(w,hx,hy, blue,pink,color);
    else
        [cho,color]=square(w,hx,hy, blue,pink,color);
    end
    if e==1
        if Wit(countin)<=6
            Wtime=0.05;
            WaitSecs(Wtime);
        elseif Wit(countin)<=12
            Wtime=0.65;
            WaitSecs(Wtime);
        elseif Wit(countin)<=18
            Wtime=1.25;
            WaitSecs(Wtime);
        end
        numb=randi([1,9]);
        Screen('TextSize', w, wr(4)*0.1);
        tb=Screen('TextBounds', w, num2str(numb));
        Screen('DrawText', w, num2str(numb), hx-tb(3)/2, hy-tb(4)/2);
        Screen('Flip',w);
        st=GetSecs;
        [press,cor,en,keys]=pushKeyName(cho,numb);
        fprintf(fw,'%d,%s,%d,%s,%f,%f,%s\n', e, cho, numb, cor, en-st, Wtime, KbName(keys));
        while press
            [press, ~, ~]=KbCheck;
        end
    elseif e==2
        if Wit(countin)<=6
            if Wit(countin)<=3
                Wtime=0.65;
                WaitSecs(Wtime);
            else
                Wtime=1.25;
                WaitSecs(Wtime);
            end
        elseif Wit(countin)<=12
            if Wit(countin)<=9
                Wtime=0.05;
                WaitSecs(Wtime);
            else
                Wtime=1.25;
                WaitSecs(Wtime);
            end
        elseif Wit(countin)<=18
            if Wit(countin)<=15
                Wtime=0.05;
                WaitSecs(Wtime);
            else
                Wtime=0.65;
                WaitSecs(Wtime);
            end
        end
        numb=randi([1,9]);
        Screen('TextSize', w, wr(4)*0.1);
        tb=Screen('TextBounds', w, num2str(numb));
        Screen('DrawText', w, num2str(numb), hx-tb(3)/2, hy-tb(4)/2);
        Screen('Flip',w);
        st=GetSecs;
        [press,cor,en,keys]=pushKeyName(cho,numb);
        fprintf(fw,'%d,%s,%d,%s,%f,%f,%s\n', e, cho, numb, cor, en-st, Wtime, KbName(keys));
        while press
            [press, ~, ~]=KbCheck;
        end
    elseif e==3
        if Wit(countin)<=6
            if Wit(countin)<=3
                Wtime=1.25;
                WaitSecs(Wtime);
            else
                Wtime=0.65;
                WaitSecs(Wtime);
            end
        elseif Wit(countin)<=12
            if Wit(countin)<=9
                Wtime=1.25;
                WaitSecs(Wtime);
            else
                Wtime=0.05;
                WaitSecs(Wtime);
            end
        elseif Wit(countin)<=18
            if Wit(countin)<=15
                Wtime=0.65;
                WaitSecs(Wtime);
            else
                Wtime=0.05;
                WaitSecs(Wtime);
            end
        end
        numb=randi([1,9]);
        Screen('TextSize', w, wr(4)*0.1);
        tb=Screen('TextBounds', w, num2str(numb));
        Screen('DrawText', w, num2str(numb), hx-tb(3)/2, hy-tb(4)/2);
        Screen('Flip',w);
        st=GetSecs;
        [press,cor,en,keys]=pushKeyName(cho,numb);
        fprintf(fw,'%d,%s,%d,%s,%f,%f,%s\n', e, cho, numb, cor, en-st, Wtime, KbName(keys));
        while press
            [press, ~, ~]=KbCheck;
        end
    end
end
countin=countin+1;
end

function [countin]=fourcount(kirikae,w,hx,hy,blue,pink,color,Wit,countin,wr,fw)
for e=1:4
    if rem(kirikae,2)==0
    [cho,color]=diamond(w,hx,hy, blue,pink,color);
else
    [cho,color]=square(w,hx,hy,blue,pink,color);
end
    if e==1
        if Wit(countin)<=6
            Wtime=0.05;
            WaitSecs(Wtime);
        elseif Wit(countin)<=12
            Wtime=0.65;
            WaitSecs(Wtime);
        elseif Wit(countin)<=18
            Wtime=1.25;
            WaitSecs(Wtime);
        end
        numb=randi([1,9]);
        Screen('TextSize', w, wr(4)*0.1);
        tb=Screen('TextBounds', w, num2str(numb));
        Screen('DrawText', w, num2str(numb), hx-tb(3)/2, hy-tb(4)/2);
        Screen('Flip',w);
        st=GetSecs;
        [press,cor,en,keys]=pushKeyName(cho,numb);
        fprintf(fw,'%d,%s,%d,%s,%f,%f,%s\n', e, cho, numb, cor, en-st, Wtime, KbName(keys));
        while press
            [press, ~, ~]=KbCheck;
        end
    elseif e==2
        if Wit(countin)<=6
            if Wit(countin)<=3
                Wtime=0.65;
                WaitSecs(Wtime);
            else
                Wtime=1.25;
                WaitSecs(Wtime);
            end
        elseif Wit(countin)<=12
            if Wit(countin)<=9
                Wtime=0.05;
                WaitSecs(Wtime);
            else
                Wtime=1.25;
                WaitSecs(Wtime);
            end
        elseif Wit(countin)<=18
            if Wit(countin)<=15
                Wtime=0.05;
                WaitSecs(Wtime);
            else
                Wtime=0.65;
                WaitSecs(Wtime);
            end
        end
        numb=randi([1,9]);
        Screen('TextSize', w, wr(4)*0.1);
        tb=Screen('TextBounds', w, num2str(numb));
        Screen('DrawText', w, num2str(numb), hx-tb(3)/2, hy-tb(4)/2);
        Screen('Flip',w);
        st=GetSecs;
        [press,cor,en,keys]=pushKeyName(cho,numb);
        fprintf(fw,'%d,%s,%d,%s,%f,%f,%s\n', e, cho, numb, cor, en-st, Wtime, KbName(keys));
        while press
            [press, ~, ~]=KbCheck;
        end
    elseif e==3
        if Wit(countin)<=6
            if Wit(countin)<=3
                Wtime=1.25;
                WaitSecs(Wtime);
            else
                Wtime=0.65;
                WaitSecs(Wtime);
            end
        elseif Wit(countin)<=12
            if Wit(countin)<=9
                Wtime=1.25;
                WaitSecs(Wtime);
            else
                Wtime=0.05;
                WaitSecs(Wtime);
            end
        elseif Wit(countin)<=18
            if Wit(countin)<=15
                Wtime=0.65;
                WaitSecs(Wtime);
            else
                Wtime=0.05;
                WaitSecs(Wtime);
            end
        end
        numb=randi([1,9]);
        Screen('TextSize', w, wr(4)*0.1);
        tb=Screen('TextBounds', w, num2str(numb));
        Screen('DrawText', w, num2str(numb), hx-tb(3)/2, hy-tb(4)/2);
        Screen('Flip',w);
        st=GetSecs;
        [press,cor,en,keys]=pushKeyName(cho,numb);
        fprintf(fw,'%d,%s,%d,%s,%f,%f,%s\n', e, cho, numb, cor, en-st, Wtime, KbName(keys));
        while press
            [press, ~, ~]=KbCheck;
        end
    else
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
        numb=randi([1,9]);
        Screen('TextSize', w, wr(4)*0.1);
        tb=Screen('TextBounds', w, num2str(numb));
        Screen('DrawText', w, num2str(numb), hx-tb(3)/2, hy-tb(4)/2);
        Screen('Flip',w);
        st=GetSecs;
        [press,cor,en,keys]=pushKeyName(cho,numb);
        fprintf(fw,'%d,%s,%d,%s,%f,%f,%s\n', e, cho, numb, cor, en-st, Wtime, KbName(keys));
        while press
            [press, ~, ~]=KbCheck;
        end
    end
end
countin=countin+1;
end

function [countin]=fivecount(kirikae,w,hx,hy,blue,pink,color,Wit,countin,wr,fw)
for e=1:5
    if rem(kirikae,2)==0
    [cho,color]=diamond(w,hx,hy, blue,pink,color);
else
    [cho,color]=square(w,hx,hy,blue,pink,color);
end
    if e==1
        if Wit(countin)<=6
            Wtime=0.05;
            WaitSecs(Wtime);
        elseif Wit(countin)<=12
            Wtime=0.65;
            WaitSecs(Wtime);
        elseif Wit(countin)<=18
            Wtime=1.25;
            WaitSecs(Wtime);
        end
        numb=randi([1,9]);
        Screen('TextSize', w, wr(4)*0.1);
        tb=Screen('TextBounds', w, num2str(numb));
        Screen('DrawText', w, num2str(numb), hx-tb(3)/2, hy-tb(4)/2);
        Screen('Flip',w);
        st=GetSecs;
        [press,cor,en,keys]=pushKeyName(cho,numb);
        fprintf(fw,'%d,%s,%d,%s,%f,%f,%s\n', e, cho, numb, cor, en-st, Wtime, KbName(keys));
        while press
            [press, ~, ~]=KbCheck;
        end
    elseif e==2
        if Wit(countin)<=6
            if Wit(countin)<=3
                Wtime=0.65;
                WaitSecs(Wtime);
            else
                Wtime=1.25;
                WaitSecs(Wtime);
            end
        elseif Wit(countin)<=12
            if Wit(countin)<=9
                Wtime=0.05;
                WaitSecs(Wtime);
            else
                Wtime=1.25;
                WaitSecs(Wtime);
            end
        elseif Wit(countin)<=18
            if Wit(countin)<=15
                Wtime=0.05;
                WaitSecs(Wtime);
            else
                Wtime=0.65;
                WaitSecs(Wtime);
            end
        end
        numb=randi([1,9]);
        Screen('TextSize', w, wr(4)*0.1);
        tb=Screen('TextBounds', w, num2str(numb));
        Screen('DrawText', w, num2str(numb), hx-tb(3)/2, hy-tb(4)/2);
        Screen('Flip',w);
        st=GetSecs;
        [press,cor,en,keys]=pushKeyName(cho,numb);
        fprintf(fw,'%d,%s,%d,%s,%f,%f,%s\n', e, cho, numb, cor, en-st, Wtime, KbName(keys));
        while press
            [press, ~, ~]=KbCheck;
        end
    elseif e==3
        if Wit(countin)<=6
            if Wit(countin)<=3
                Wtime=1.25;
                WaitSecs(Wtime);
            else
                Wtime=0.65;
                WaitSecs(Wtime);
            end
        elseif Wit(countin)<=12
            if Wit(countin)<=9
                Wtime=1.25;
                WaitSecs(Wtime);
            else
                Wtime=0.05;
                WaitSecs(Wtime);
            end
        elseif Wit(countin)<=18
            if Wit(countin)<=15
                Wtime=0.65;
                WaitSecs(Wtime);
            else
                Wtime=0.05;
                WaitSecs(Wtime);
            end
        end
        numb=randi([1,9]);
        Screen('TextSize', w, wr(4)*0.1);
        tb=Screen('TextBounds', w, num2str(numb));
        Screen('DrawText', w, num2str(numb), hx-tb(3)/2, hy-tb(4)/2);
        Screen('Flip',w);
        st=GetSecs;
        [press,cor,en,keys]=pushKeyName(cho,numb);
        fprintf(fw,'%d,%s,%d,%s,%f,%f,%s\n', e, cho, numb, cor, en-st, Wtime, KbName(keys));
        while press
            [press, ~, ~]=KbCheck;
        end
    else
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
        numb=randi([1,9]);
        Screen('TextSize', w, wr(4)*0.1);
        tb=Screen('TextBounds', w, num2str(numb));
        Screen('DrawText', w, num2str(numb), hx-tb(3)/2, hy-tb(4)/2);
        Screen('Flip',w);
        st=GetSecs;
        [press,cor,en,keys]=pushKeyName(cho,numb);
        fprintf(fw,'%d,%s,%d,%s,%f,%f,%s\n', e, cho, numb, cor, en-st, Wtime, KbName(keys));
        while press
            [press, ~, ~]=KbCheck;
        end
    end
end
countin=countin+1;

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