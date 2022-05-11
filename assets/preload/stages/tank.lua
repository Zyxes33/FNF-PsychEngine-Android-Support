local xx = 350.95;
local yy = 473;
local xx2 = 958.9;
local yy2 = 430;
local ofs = 60;
local followchars = true;

function onCreate()
	-- background shit
	makeLuaSprite('tankSky', 'week7/tankSky', -400,-400);
	setLuaSpriteScrollFactor('tankSky', 0, 0);
	scaleObject('tankGround', 15, 1.5)
	makeLuaSprite('tankClouds', 'week7/tankClouds', -700, -100);
	setLuaSpriteScrollFactor('tankClouds', 0.1, 0.1);

	makeLuaSprite('tankGround', 'week7/tankGround', -420,-150);
	setLuaSpriteScrollFactor('tankMountains', 1, 1);
	scaleObject('tankGround', 1.15, 1.15);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('tankMountains', 'week7/tankMountains', -300,-20);
		setLuaSpriteScrollFactor('tankMountains', 0.2, 0.2);
		scaleObject('tankMountains', 1.2, 1.2);
		
		makeAnimatedLuaSprite('tankWatchtower', 'week7/tankWatchtower', 100,30);
		
		
		makeAnimatedLuaSprite('smokeRight', 'week7/smokeRight', 1100,-100);
		setLuaSpriteScrollFactor('smokeRight', 0.4, 0.4);
		
		makeAnimatedLuaSprite('smokeLeft', 'week7/smokeLeft', -200,-100);
		setLuaSpriteScrollFactor('smokeLeft', 0.4, 0.4);
		
		makeAnimatedLuaSprite('tank0', 'week7/tank0', -555,680);
		setLuaSpriteScrollFactor('tank0',1.7, 1.5);
		
		makeAnimatedLuaSprite('tank1', 'week7/tank1', -300,750);
		setLuaSpriteScrollFactor('tank1',2.0, 0.2);
		
		makeAnimatedLuaSprite('tank2', 'week7/tank2', 450,940);
		setLuaSpriteScrollFactor('tank2',1.5, 1.5);
		
		makeAnimatedLuaSprite('tank3', 'week7/tank3', 1300,1300);
		setLuaSpriteScrollFactor('tank3',3.5, 2.5);
		
		makeAnimatedLuaSprite('tank4', 'week7/tank4', 1300,900);
		setLuaSpriteScrollFactor('tank4',1.5, 1.5);
		
		makeAnimatedLuaSprite('tank5', 'week7/tank5', 1620,710);
		setLuaSpriteScrollFactor('tank5',1.5, 1.5);
		
		makeAnimatedLuaSprite('tankRolling', 'week7/tankRolling', 300,300);
		setLuaSpriteScrollFactor('tankRolling',0.5, 0.5);

		setPropertyFromClass('GameOverSubstate', 'characterName', 'edd-dead');
		
	end

	addLuaSprite('tankSky', false);
	addLuaSprite('tankClouds', false);
	addLuaSprite('tankMountains', false);
	addLuaSprite('smokeRight', false); --Added offscreen before it starts moving.
	addAnimationByPrefix('smokeRight', 'idle', 'SmokeRight', 24, true);
	addLuaSprite('smokeLeft', false); --Added offscreen before it starts moving.
	addAnimationByPrefix('smokeLeft', 'idle', 'SmokeBlurLeft', 24, true);
	addLuaSprite('tankRolling', false); --Added offscreen before it starts moving.
	addAnimationByPrefix('tankRolling', 'idle', 'BG tank w lighting', 24, true);
	addLuaSprite('tankWatchtower', false); --Added offscreen before it starts moving.
	addAnimationByPrefix('tankWatchtower', 'idle', 'watchtower gradient color instance 1', 24, true);
	
	addLuaSprite('tankGround', false);
	addLuaSprite('tank0', true); --Added offscreen before it starts moving.
	addAnimationByPrefix('tank0','idle', 'fg tankhead far right instance 100', 24, true);
	addLuaSprite('tank1', true); --Added offscreen before it starts moving.
	addAnimationByPrefix('tank1','idle', 'fg tankhead 5 ', 24, false);
	addLuaSprite('tank2', true); --Added offscreen before it starts moving.
	addAnimationByPrefix('tank2','idle', 'foreground man 3 ', 24, true);
	addLuaSprite('tank3', true); --Added offscreen before it starts moving.
	addAnimationByPrefix('tank3','idle', 'fg tankhead 4 ', 24, true);
	addLuaSprite('tank4', true); --Added offscreen before it starts moving.
	addAnimationByPrefix('tank4','idle', 'fg tankman bobbin 3 ', 24, true);
	addLuaSprite('tank5', true); --Added offscreen before it starts moving.
	addAnimationByPrefix('tank5','idle', 'fg tankhead far right ', 24, true);
end

function onUpdate(elapsed)
	moveTank(elapsed);
end

function onUpdate()
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.9)
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
            setProperty('defaultCamZoom',1.1)
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.2 then
        setProperty('health', health- 0.025);
    end
end