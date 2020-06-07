import mx.transitions.Tween;
import mx.transitions.easing.*;
System.security.allowDomain("*");
var __author = "Ben";

var SHELL = _global.getCurrentShell();
var ENGINE = _global.getCurrentEngine();
var AIRTOWER = _global.getCurrentAirtower();
var INTERFACE = _global.getCurrentInterface();

INTERFACE.rainbowfy = function(field)
{
	if(field.rainbowfied == undefined || field.textColor != field.oldTextColor)
	{
		field.textColor = field.textColor + "0";
		for(var i = 0; i < field.text.length; i++)
		{
			var _local1 = field.getTextFormat();
			_local1.color = Math.round(Math.random()*0xFFFFFF);
			field.setTextFormat(i, i + 1, _local1);
		}
		field.rainbowfied = true;
		field.oldTextColor = field.textColor;
	}
};

var onPlayerLoadInit = ENGINE.onPlayerLoadInit;
ENGINE.onPlayerLoadInit = function(event, player_ob, player_id, targetX, targetY)
{
	onPlayerLoadInit(event, player_ob, player_id, targetX, targetY);
	if (SHELL.getIsRoomIgloo() || (!ENGINE.isPositionValid(player_ob.x, player_ob.y)))
	{
		var _local7 = ENGINE.getRoomMovieClip().start_x; 
		var _local6 = ENGINE.getRoomMovieClip().start_y; 
		var _local4 = ENGINE.getRandomPlayerPos(player_ob, _local7, _local6, ENGINE.RANDOM_RANGE_FOR_MAP_ENTRY);
		if(!player_ob.walls || SHELL.isMyPlayer(player_id) || (player_ob.x == 0 && player_ob.y == 0))
		{
			ENGINE.updatePlayerPosition(player_id, _local4.x, _local4.y); 
		} 
		else
		{
			ENGINE.updatePlayerPosition(player_id, player_ob.x, player_ob.y);
		}
	}
	else
	{ 
		ENGINE.updatePlayerPosition(player_id, player_ob.x, player_ob.y); 
	}
};

ENGINE.findPlayerPath = function(player_id, x, y)
{ 
	var player_ob = SHELL.getPlayerObjectById(player_id);
	var _local12 = ENGINE.getPlayerMovieClip(player_id); 
	var _local7 = ENGINE.getRoomBlockMovieClip(); 
	var _local13 = ENGINE.getValidXPosition(x); 
	var _local14 = ENGINE.getValidYPosition(y); 
	var _local11 = Math.round(_local12._x); 
	var _local10 = Math.round(_local12._y); 
	var _local15 = ENGINE.findDistance(_local11, _local10, _local13, _local14); 
	var _local6 = Math.round(_local15); 
	var _local9 = (_local13 - _local11) / _local6; 
	var _local8 = (_local14 - _local10) / _local6; 
	var _local4 = _local11; var _local3 = _local10; 
	var _local5 = new Object();
	_local5.x = _local11;
	_local5.y = _local10;
	var _local16 = _local7.hitTest(_local11, _local10, true);
	while (_local6 > 0)
	{ 
		_local4 = _local4 + _local9;
		_local3 = _local3 + _local8;
		var _local2 = Math.round(_local4);
		var _local1 = Math.round(_local3);
		if(!player_ob.walls)
		{
			if (_local7.hitTest(_local2, _local1, true))
			{
				break; 
			} 
		}
		_local5.x = _local2;
		_local5.y = _local1; 
		_local6--; 
	} 
	return(_local5); 
};

var showBalloon = INTERFACE.showBalloon;
INTERFACE.showBalloon = function(player_id, message)
{
	showBalloon(player_id, message);
	var player_ob = SHELL.getPlayerObjectById(player_id);
	if(player_ob.bubblecolor)
	{
		var _loc1_ = INTERFACE.balloons_mc["p" + player_id].balloon_mc;
		var _loc3_ = INTERFACE.balloons_mc["p" + player_id].pointer_mc;
		var _loc2_:Color = new Color(_loc1_);
		_loc2_.setRGB(player_ob.bubblecolor);
		var _loc4_:Color = new Color(_loc3_);
		_loc4_.setRGB(player_ob.bubblecolor);
	}
	if(player_ob.bubbletext)
	{
		var _loc5_ = INTERFACE.balloons_mc["p" + player_id].message_txt;
		if(player_ob.bubbletext == "r")
		{
			INTERFACE.rainbowfy(_loc5_);
		}
		else
		{
			var _loc6_:Color = new Color(_loc5_);
			_loc6_.setRGB(player_ob.bubbletext);
		}
	}
};

var showEmoteBalloon = INTERFACE.showEmoteBalloon;
INTERFACE.showEmoteBalloon = function(player_id, emoteFrame)
{ 
	showEmoteBalloon(player_id, emoteFrame); 
	var player_ob = SHELL.getPlayerObjectById(player_id);
	if(player_ob.bubblecolor)
	{
		var _loc3_ = INTERFACE.balloons_mc["p" + player_id].balloon_mc;
		var _loc4_ = INTERFACE.balloons_mc["p" + player_id].pointer_mc;
		var _loc1_:Color = new Color(_loc3_);
		_loc1_.setRGB(player_ob.bubblecolor);
		var _loc2_:Color = new Color(_loc4_);
		_loc2_.setRGB(player_ob.bubblecolor);
	}
};

ENGINE.movePlayer = function(player_id, target_x, target_y, is_trigger, frame)
{ 
	var player_ob = SHELL.getPlayerObjectById(player_id);
	var _local4 = ENGINE.getRoomMovieClip(); 
	if (is_trigger == undefined)
	{ 
		is_trigger = true; 
	} 
	var mc = ENGINE.getPlayerMovieClip(player_id); 
	var start_x = Math.round(mc._x); 
	var start_y = Math.round(mc._y); 
	if (mc.is_reading)
	{ 
		ENGINE.removePlayerBook(player_id);
	}
	if (!mc.is_ready)
	{ 
		ENGINE.updatePlayerPosition(player_id, target_x, target_y);
	}
	else
	{ 
		var _local3 = ENGINE.findDistance(start_x, start_y, target_x, target_y); 
		if (_local4.ease_method == "easeInOutQuad")
		{ 
			var easeFunction = ENGINE.mathEaseInOutQuad; 
		}
		else
		{ 
			var easeFunction = ENGINE.mathLinearTween; 
		} 
		var _local2 = ENGINE.findAngle(start_x, start_y, target_x, target_y); 
		var d = ENGINE.findDirection(_local2); 
		if(player_ob.speed) {
			var duration = (_local3 / player_ob.speed);
		} else {
			var duration = (_local3 / 4);
		}
		var change_x = (target_x - start_x); 
		var change_y = (target_y - start_y); 
		mc.is_moving = false; 
		ENGINE.updatePlayerFrame(player_id, d + 8); 
		var t = 0;
		mc.onEnterFrame = function()
		{ 
			t++; 
			if (t < duration)
			{ 
				x = easeFunction(t, start_x, change_x, duration); 
				y = easeFunction(t, start_y, change_y, duration); 
				ENGINE.updatePlayerPosition(player_id, x, y);
			}
			else
			{ 
				mc.is_moving = false; 
				ENGINE.updatePlayerPosition(player_id, target_x, target_y); 
				ENGINE.updatePlayerFrame(player_id, d); 
				ENGINE.SHELL.sendPlayerMoveDone(player_id); 
				this.onEnterFrame = null; 
				delete this.onEnterFrame; 
				if (ENGINE.SHELL.isMyPlayer(player_id))
				{ 
					ENGINE.playerMoved.dispatch(); 
					ENGINE.setPlayerAction("wait"); 
					if (is_trigger && (ENGINE.isMouseActive()))
					{ 
						ENGINE.checkTrigger(mc); 
						ENGINE.checkFieldOpTriggered(mc); 
					} 
					if (frame != undefined)
					{ 
						ENGINE.sendPlayerFrame(frame); 
					} 
				} 
			} 
		}; 
	} 
};

ENGINE.throwBall = function (player_id, target_x, target_y, start_height, max_height, wait)
{
	var player_ob = SHELL.getPlayerObjectById(player_id);
	var _local2 = ENGINE.getPlayerMovieClip(player_id);
	var room_mc = ENGINE.getRoomMovieClip();
	if (_local2.is_reading)
	{
		ENGINE.removePlayerBook(player_id);
	}
	if (_local2.is_ready && (!_local2.is_moving))
	{
		if (ENGINE.throw_item_counter == undefined)
		{
			ENGINE.throw_item_counter = 0;
		}
		if (ENGINE.throw_item_counter > 10)
		{
			ENGINE.throw_item_counter = 0;
		}
		var start_x = _local2._x;
		var start_y = _local2._y;
		var c = (ENGINE.throw_item_counter++);
		var _local3 = "i" + c;
		if (room_mc[_local3] != undefined)
		{
			room_mc[_local3].removeMovieClip();
		}
		room_mc.attachMovie("ball", _local3, 1000200 + c);
		var mc = room_mc[_local3];
		mc.player_id = player_id;
		mc.id = c;
		mc._x = start_x;
		mc._y = start_y;
		ENGINE.updateItemDepth(mc, c);
		var _local6 = ENGINE.findDistance(start_x, start_y, target_x, target_y);
		var _local5 = ENGINE.findAngle(start_x, start_y, target_x, target_y);
		var _local4 = Math.round(ENGINE.findDirection(_local5) / 2);
		ENGINE.updatePlayerFrame(player_id, 26 + _local4);
		var duration = (_local6 / 15);
		var change_x = (target_x - start_x);
		var change_y = (target_y - start_y);
		var peak = (duration / 2);
		var change_height1 = (max_height - start_height);
		var change_height2 = (-max_height);
		mc.art._y = start_height;
		mc._visible = false;
		var t = 0;
		var w = 0;
		mc.onEnterFrame = function ()
		{
			if (w > wait)
			{
				mc._visible = true;
				if(player_ob.snowball)
				{
					var _local7:Color = new Color(mc);
					_local7.setRGB(player_ob.snowball);
				}
				t++;
				if (t < duration)
				{
					mc._x = ENGINE.mathLinearTween(t, start_x, change_x, duration);
					mc._y = ENGINE.mathLinearTween(t, start_y, change_y, duration);
					ENGINE.updateItemDepth(mc, c);
					if (t < peak)
					{
						mc.art._y = ENGINE.mathEaseOutQuad(t, start_height, change_height1, peak);
					}
					else
					{
						mc.art._y = ENGINE.mathEaseInQuad(t - peak, max_height, change_height2, peak);
					}
				}
				else
				{
					mc._x = target_x;
					mc._y = target_y;
					mc.art._y = 0;
					mc.gotoAndStop(2);
					room_mc.handleThrow(mc);
					SHELL.updateListeners(SHELL.BALL_LAND, {id:mc.id, player_id:mc.player_id, x:mc._x, y:mc._y});
					if (room_mc.snowballBlock != undefined)
					{
						if (room_mc.snowballBlock.hitTest(mc._x, mc._y, true))
						{
							mc._visible = false;
						}
					}
					this.onEnterFrame = null;
				}
			}
			else
			{
				w++;
			}
		}
	}
};

var updatePlayerWidget = INTERFACE.updatePlayerWidget;
INTERFACE.updatePlayerWidget = function()
{
	updatePlayerWidget();
	var player_id = INTERFACE.getActivePlayerId();
	var player_ob = INTERFACE.getPlayerObject(player_id);
	var _loc1_ = INTERFACE.PLAYER_WIDGET.art_mc;
	_loc1_.mood_txt.removeTextField();
	_loc1_.createTextField('mood_txt', 3, 10, 230, 200, 25);
	var _loc2_ = _loc1_.mood_txt;
	if(SHELL.isMyPlayer(player_id))
	{
		_loc2_.type = "input";
		_loc2_.selectable = true;
		_loc2_.maxChars = 40;
		if(!player_ob.mood)
		{
			_loc2_.text = "Click to set mood";
		}
	}
	if(player_ob.mood)
	{
		_loc2_.text = player_ob.mood;
	}
	_loc2_.onSetFocus = function()
	{
		if(!player_ob.mood)
		{
			_loc2_.text = "";
		}
		INTERFACE.stopQuickKeys();
	}
	_loc2_.onKillFocus = function()
	{
		var _loc3_ = _loc2_.text;
		if(_loc3_ != player_ob.mood)
		{
			SHELL.sendUpdatePlayerMood(mood);
			INTERFACE.startQuickKeys();
		}
	}
	var _loc4_ = new TextFormat();
	_loc4_.align = "center";
	_loc4_.font = "Arial";
	_loc2_.setTextFormat(_loc4_);
	_loc2_.setNewTextFormat(_loc4_);
	if(player_ob.moodcolor)
	{
		if(player_ob.moodcolor == "r")
		{
			INTERFACE.rainbowfy(_local1);
		}
		else
		{
			_loc2_.textColor = player_ob.moodcolor;
		}
	}
	else
	{
		_loc2_.textColor = 0xFFFFFF;
	}
	if(player_ob.transparency)
	{
		_loc1_.paper_doll_mc._alpha = player_ob.transparency;
	}
	else
	{
		_loc1_.paper_doll_mc._alpha = 100;
	}
};

SHELL.sendUpdatePlayerNameglow = function(color)
{
	if(!isNaN(color))
	{
		AIRTOWER.send(AIRTOWER.PLAY_EXT,AIRTOWER.SETTING_HANDLER + "#" + AIRTOWER.UPDATE_PLAYER_NAMEGLOW,[color],"str",SHELL.getCurrentServerRoomId());
	}
};

SHELL.handleSendUpdatePlayerNameglow = function(obj)
{
	var _loc5_ = obj.shift();
	var _loc2_ = Number(obj[0]);
	var _loc3_ = Number(obj[1]);
	if(!isNaN(_loc2_))
	{
		var _loc1_ = SHELL.getPlayerObjectFromRoomById(_loc2_);
		if(_loc1_ != undefined)
		{
			_loc1_.nameglow = _loc3_;
			_loc1_.frame_hack = SHELL.buildFrameHacksString(_loc1_);
			SHELL.updateListeners(SHELL.UPDATE_PLAYER,_loc1_);
		}
	}
};

SHELL.sendUpdatePlayerNamecolor = function(color)
{
	if(!isNaN(color))
	{
		AIRTOWER.send(AIRTOWER.PLAY_EXT,AIRTOWER.SETTING_HANDLER + "#" + AIRTOWER.UPDATE_PLAYER_NAMECOLOR,[color],"str",SHELL.getCurrentServerRoomId());
	}
};

SHELL.handleSendUpdatePlayerNamecolor = function(obj)
{
	var _loc5_ = obj.shift();
	var _loc2_ = Number(obj[0]);
	var _loc3_ = Number(obj[1]);
	if(!isNaN(_loc2_))
	{
		var _loc1_ = SHELL.getPlayerObjectFromRoomById(_loc2_);
		if(_loc1_ != undefined)
		{
			_loc1_.namecolor = _loc3_;
			_loc1_.frame_hack = SHELL.buildFrameHacksString(_loc1_);
			SHELL.updateListeners(SHELL.UPDATE_PLAYER,_loc1_);
		}
	}
};

SHELL.sendUpdatePlayerRingcolor = function(color)
{
	if(!isNaN(color))
	{
		AIRTOWER.send(AIRTOWER.PLAY_EXT,AIRTOWER.SETTING_HANDLER + "#" + AIRTOWER.UPDATE_PLAYER_RINGCOLOR,[color],"str",SHELL.getCurrentServerRoomId());
	}
};

SHELL.handleSendUpdatePlayerRingcolor = function(obj)
{
	var _loc5_ = obj.shift();
	var _loc2_ = Number(obj[0]);
	var _loc3_ = Number(obj[1]);
	if(!isNaN(_loc2_))
	{
		var _loc1_ = SHELL.getPlayerObjectFromRoomById(_loc2_);
		if(_loc1_ != undefined)
		{
			_loc1_.ringcolor = _loc3_;
			_loc1_.frame_hack = SHELL.buildFrameHacksString(_loc1_);
			SHELL.updateListeners(SHELL.UPDATE_PLAYER,_loc1_);
		}
	}
};

SHELL.sendUpdatePlayerSize = function(size)
{
	if(!isNaN(size))
	{
		AIRTOWER.send(AIRTOWER.PLAY_EXT,AIRTOWER.SETTING_HANDLER + "#" + AIRTOWER.UPDATE_PLAYER_SIZE,[size],"str",SHELL.getCurrentServerRoomId());
	}
};

SHELL.handleSendUpdatePlayerSize = function(obj)
{
	var _loc5_ = obj.shift();
	var _loc2_ = Number(obj[0]);
	var _loc3_ = Number(obj[1]);
	if(!isNaN(_loc2_))
	{
		var _loc1_ = SHELL.getPlayerObjectFromRoomById(_loc2_);
		if(_loc1_ != undefined)
		{
			_loc1_.obese = _loc3_;
			_loc1_.frame_hack = SHELL.buildFrameHacksString(_loc1_);
			SHELL.updateListeners(SHELL.UPDATE_PLAYER,_loc1_);
		}
	}
};

SHELL.sendUpdatePlayerTransparency = function(alpha)
{
	if(!isNaN(alpha))
	{
		AIRTOWER.send(AIRTOWER.PLAY_EXT,AIRTOWER.SETTING_HANDLER + "#" + AIRTOWER.UPDATE_PLAYER_TRANSPARENCY,[alpha],"str",SHELL.getCurrentServerRoomId());
	}
};

SHELL.handleSendUpdatePlayerTransparency = function(obj)
{
	var _loc5_ = obj.shift();
	var _loc2_ = Number(obj[0]);
	var _loc3_ = Number(obj[1]);
	if(!isNaN(_loc2_))
	{
		var _loc1_ = SHELL.getPlayerObjectFromRoomById(_loc2_);
		if(_loc1_ != undefined)
		{
			_loc1_.transparency = _loc3_;
			_loc1_.frame_hack = SHELL.buildFrameHacksString(_loc1_);
			SHELL.updateListeners(SHELL.UPDATE_PLAYER,_loc1_);
		}
	}
};

SHELL.sendUpdatePlayerRotation = function(degrees)
{
	if(!isNaN(degrees))
	{
		AIRTOWER.send(AIRTOWER.PLAY_EXT,AIRTOWER.SETTING_HANDLER + "#" + AIRTOWER.UPDATE_PLAYER_ROTATION,[degrees],"str",SHELL.getCurrentServerRoomId());
	}
};

SHELL.handleSendUpdatePlayerRotation = function(obj)
{
	var _loc5_ = obj.shift();
	var _loc2_ = Number(obj[0]);
	var _loc3_ = Number(obj[1]);
	if(!isNaN(_loc2_))
	{
		var _loc1_ = SHELL.getPlayerObjectFromRoomById(_loc2_);
		if(_loc1_ != undefined)
		{
			_loc1_.rotation = _loc3_;
			_loc1_.frame_hack = SHELL.buildFrameHacksString(_loc1_);
			SHELL.updateListeners(SHELL.UPDATE_PLAYER,_loc1_);
		}
	}
};

SHELL.sendUpdatePlayerBubblecolor = function(color)
{
	if(!isNaN(color))
	{
		AIRTOWER.send(AIRTOWER.PLAY_EXT,AIRTOWER.SETTING_HANDLER + "#" + AIRTOWER.UPDATE_PLAYER_BUBBLECOLOR,[color],"str",SHELL.getCurrentServerRoomId());
	}
};

SHELL.handleSendUpdatePlayerBubblecolor = function(obj)
{
	var _loc5_ = obj.shift();
	var _loc2_ = Number(obj[0]);
	var _loc3_ = Number(obj[1]);
	if(!isNaN(_loc2_))
	{
		var _loc1_ = SHELL.getPlayerObjectFromRoomById(_loc2_);
		if(_loc1_ != undefined)
		{
			_loc1_.bubblecolor = _loc3_;
			_loc1_.frame_hack = SHELL.buildFrameHacksString(_loc1_);
			SHELL.updateListeners(SHELL.UPDATE_PLAYER,_loc1_);
		}
	}
};

SHELL.sendUpdatePlayerBubbletext = function(color)
{
	if(!isNaN(color))
	{
		AIRTOWER.send(AIRTOWER.PLAY_EXT,AIRTOWER.SETTING_HANDLER + "#" + AIRTOWER.UPDATE_PLAYER_BUBBLETEXT,[color],"str",SHELL.getCurrentServerRoomId());
	}
};

SHELL.handleSendUpdatePlayerBubbletext = function(obj)
{
	var _loc5_ = obj.shift();
	var _loc2_ = Number(obj[0]);
	var _loc3_ = Number(obj[1]);
	if(!isNaN(_loc2_))
	{
		var _loc1_ = SHELL.getPlayerObjectFromRoomById(_loc2_);
		if(_loc1_ != undefined)
		{
			_loc1_.bubbletext = _loc3_;
			_loc1_.frame_hack = SHELL.buildFrameHacksString(_loc1_);
			SHELL.updateListeners(SHELL.UPDATE_PLAYER,_loc1_);
		}
	}
};

SHELL.sendUpdatePlayerWalls = function(bool)
{
	if(!isNaN(bool))
	{
		AIRTOWER.send(AIRTOWER.PLAY_EXT,AIRTOWER.SETTING_HANDLER + "#" + AIRTOWER.UPDATE_PLAYER_WALLS,[bool],"str",SHELL.getCurrentServerRoomId());
	}
};

SHELL.handleSendUpdatePlayerWalls = function(obj)
{
	var _loc5_ = obj.shift();
	var _loc2_ = Number(obj[0]);
	var _loc3_ = Number(obj[1]);
	if(!isNaN(_loc2_))
	{
		var _loc1_ = SHELL.getPlayerObjectFromRoomById(_loc2_);
		if(_loc1_ != undefined)
		{
			_loc1_.walls = _loc3_;
			_loc1_.frame_hack = SHELL.buildFrameHacksString(_loc1_);
			SHELL.updateListeners(SHELL.UPDATE_PLAYER,_loc1_);
		}
	}
};

SHELL.sendUpdatePlayerSpeed = function(speed)
{
	if(!isNaN(speed))
	{
		AIRTOWER.send(AIRTOWER.PLAY_EXT,AIRTOWER.SETTING_HANDLER + "#" + AIRTOWER.UPDATE_PLAYER_SPEED,[speed],"str",SHELL.getCurrentServerRoomId());
	}
};

SHELL.handleSendUpdatePlayerSpeed = function(obj)
{
	var _loc5_ = obj.shift();
	var _loc2_ = Number(obj[0]);
	var _loc3_ = Number(obj[1]);
	if(!isNaN(_loc2_))
	{
		var _loc1_ = SHELL.getPlayerObjectFromRoomById(_loc2_);
		if(_loc1_ != undefined)
		{
			_loc1_.speed = _loc3_;
			_loc1_.frame_hack = SHELL.buildFrameHacksString(_loc1_);
			SHELL.updateListeners(SHELL.UPDATE_PLAYER,_loc1_);
		}
	}
};

SHELL.sendUpdatePlayerMood = function(mood)
{
	if(!isNaN(mood))
	{
		AIRTOWER.send(AIRTOWER.PLAY_EXT,AIRTOWER.SETTING_HANDLER + "#" + AIRTOWER.UPDATE_PLAYER_MOOD,[mood],"str",SHELL.getCurrentServerRoomId());
	}
};

SHELL.handleSendUpdatePlayerMood = function(obj)
{
	var _loc5_ = obj.shift();
	var _loc2_ = Number(obj[0]);
	var _loc3_ = Number(obj[1]);
	if(!isNaN(_loc2_))
	{
		var _loc1_ = SHELL.getPlayerObjectFromRoomById(_loc2_);
		if(_loc1_ != undefined)
		{
			_loc1_.mood = _loc3_;
			_loc1_.frame_hack = SHELL.buildFrameHacksString(_loc1_);
			SHELL.updateListeners(SHELL.UPDATE_PLAYER,_loc1_);
		}
	}
};

SHELL.sendUpdatePlayerMoodcolor = function(color)
{
	if(!isNaN(color))
	{
		AIRTOWER.send(AIRTOWER.PLAY_EXT,AIRTOWER.SETTING_HANDLER + "#" + AIRTOWER.UPDATE_PLAYER_MOODCOLOR,[color],"str",SHELL.getCurrentServerRoomId());
	}
};

SHELL.handleSendUpdatePlayerMoodcolor = function(obj)
{
	var _loc5_ = obj.shift();
	var _loc2_ = Number(obj[0]);
	var _loc3_ = Number(obj[1]);
	if(!isNaN(_loc2_))
	{
		var _loc1_ = SHELL.getPlayerObjectFromRoomById(_loc2_);
		if(_loc1_ != undefined)
		{
			_loc1_.moodcolor = _loc3_;
			_loc1_.frame_hack = SHELL.buildFrameHacksString(_loc1_);
			SHELL.updateListeners(SHELL.UPDATE_PLAYER,_loc1_);
		}
	}
};

SHELL.sendUpdatePlayerSnowball = function(color)
{
	if(!isNaN(color))
	{
		AIRTOWER.send(AIRTOWER.PLAY_EXT,AIRTOWER.SETTING_HANDLER + "#" + AIRTOWER.UPDATE_PLAYER_SNOWBALL,[color],"str",SHELL.getCurrentServerRoomId());
	}
};

SHELL.handleSendUpdatePlayerSnowball = function(obj)
{
	var _loc5_ = obj.shift();
	var _loc2_ = Number(obj[0]);
	var _loc3_ = Number(obj[1]);
	if(!isNaN(_loc2_))
	{
		var _loc1_ = SHELL.getPlayerObjectFromRoomById(_loc2_);
		if(_loc1_ != undefined)
		{
			_loc1_.snowball = _loc3_;
			_loc1_.frame_hack = SHELL.buildFrameHacksString(_loc1_);
			SHELL.updateListeners(SHELL.UPDATE_PLAYER,_loc1_);
		}
	}
};

SHELL.makePlayerObjectFromString = function(player_string) 
{ 
	var _local2 = player_string.split("|"); 
	var _local3 = Number(_local2[0]); 
	var _local4 = String(_local2[1]); 
	var _local6 = Number(_local2[2]); 
	var _local5; 
	if (SHELL.isValidString(_local4)) 
	{ 
		_local5 = com.clubpenguin.util.Localization.getLocalizedNickname(_local3, _local4, _local6, SHELL.getLanguageBitmask()); 
	} 
	else if (SHELL.isPlayerMascotById(_local3)) 
	{ 
		_local5 = SHELL.getMascotNicknameByID(_local3); 
	} 
	var _local1 = new Object(); 
	_local1.nickname = _local5;
	_local1.username = _local4;
	_local1.player_id = _local3;
	_local1.colour_id = Number(_local2[3]) || 0;
	_local1.head = Number(_local2[4]) || 0;
	_local1.face = Number(_local2[5]) || 0;
	_local1.neck = Number(_local2[6]) || 0; 
	_local1.body = Number(_local2[7]) || 0;
	_local1.hand = Number(_local2[8]) || 0; 
	_local1.feet = Number(_local2[9]) || 0; 
	_local1.flag_id = Number(_local2[10]) || 0; 
	_local1.photo_id = Number(_local2[11]) || 0;
	_local1.x = Number(_local2[12]) || 0; 
	_local1.y = Number(_local2[13]) || 0; 
	_local1.frame = Number(_local2[14]) || 0; 
	_local1.is_member = Boolean(Number(_local2[15]) || 0); 
	_local1.total_membership_days = Number(_local2[16]) || 0; 
	_local1.nameglow = _local2[21];
	_local1.namecolor = _local2[22] || 0;
	_local1.bubblecolor = _local2[23] || 0;
	_local1.bubbletext = _local2[24] || 0;
	_local1.ringcolor = _local2[25];
	_local1.obese = Number(_local2[26]) || 0;
	_local1.transparency = _local2[27];
	_local1.rotation = Number(_local2[28]) || 0;
	_local1.walls = Boolean(Number(_local2[29]) || 0);
	_local1.speed = Number(_local2[30]) || 0;
	_local1.mood = _local2[31];
	_local1.moodcolor = _local2[32] || 0;
	_local1.snowball = Number(_local2[33]) || 0;
	_local1.frame_hack = SHELL.buildFrameHacksString(_local1); 
	_local1.thrownSnowballInCurrentRoom = false; 
	_local1.emoteIDDisplayedInCurrentRoom = -1; 
	return(_local1);
};

ENGINE.updatePlayer = function(player_ob)
{
	ENGINE.traceObject(player_ob);
	var _loc4_ = player_ob.player_id;
	var _loc2_ = ENGINE.getPlayerMovieClip(_loc4_);
	if(!SHELL.isMyPlayer(_loc4_))
	{
		if(_loc2_.art_mc.ring == undefined)
		{
			_loc2_.art_mc.onEnterFrame = com.clubpenguin.util.Delegate.create(ENGINE,ENGINE.testForPenguinRing,_loc2_.art_mc);
		}
		else
		{
			_loc2_.art_mc.ring._visible = false;
		}
	}
	if(_loc2_.frame > 26)
	{
		_loc2_.frame = 1;
	}
	if(_loc2_.colour_id != player_ob.colour_id)
	{
		ENGINE.updateColour(_loc2_.art_mc.body,player_ob.colour_id);
		_loc2_.colour_id = player_ob.colour_id;
	}
	ENGINE.updatePlayerItem(_loc2_,player_ob,"head",60);
	ENGINE.updatePlayerItem(_loc2_,player_ob,"face",50);
	ENGINE.updatePlayerItem(_loc2_,player_ob,"hand",40);
	ENGINE.updatePlayerItem(_loc2_,player_ob,"neck",30);
	ENGINE.updatePlayerItem(_loc2_,player_ob,"body",20);
	ENGINE.updatePlayerItem(_loc2_,player_ob,"feet",10);
	ENGINE.updatePlayerFrame(_loc4_,_loc2_.frame);
	ENGINE.updatePlayerNameglow(_loc4_, player_ob);
	ENGINE.updatePlayerNamecolor(_loc4_, player_ob);
	ENGINE.updatePlayerRingcolor(_loc4_, player_ob);
	ENGINE.updatePlayerSize(_loc4_, player_ob);
	ENGINE.updatePlayerTransparency(_loc4_, player_ob);
	ENGINE.updatePlayerRotation(_loc4_, player_ob);
};

ENGINE.updatePlayerNameglow = function(player_id, player_ob) 
{
	if(player_ob.nameglow !== ''){
        var _loc1_ = new flash.filters.DropShadowFilter(0, 0, player_ob.nameglow, 20, 2, 2, 15, 3);
	    INTERFACE.nicknames_mc["p" + player_id].name_txt.filters = [_loc1_];
    }
};

ENGINE.updatePlayerNamecolor = function(player_id, player_ob) 
{
	var _loc2_ = INTERFACE.nicknames_mc["p" + player_id].name_txt;
	if(player_ob.namecolor == "r") {
		INTERFACE.rainbowfy(_loc2_);
	} else {
		_loc2_.textColor = player_ob.namecolor;
	}
};

ENGINE.updatePlayerRingcolor = function(player_id, player_ob)
{
	if(player_ob.ringcolor !== ''){
        var _loc1_ = ENGINE.room_mc.load_mc["p" + player_id].art_mc.ring;
        _loc1_._visible = true;
        var _loc2_:Color = new Color(_loc1_);
        _loc2_.setRGB(player_ob.ringcolor);
    }
};

ENGINE.updatePlayerSize = function(player_id, player_ob)
{
	var _loc1_ = ENGINE.getPlayerMovieClip(player_id);
	new Tween(_loc1_, "_xscale", Regular.easeOut, _loc1_._xscale, int(player_ob.obese), 1, true);
	new Tween(_loc1_, "_yscale", Regular.easeOut, _loc1_._yscale, int(player_ob.obese), 1, true);
};

ENGINE.updatePlayerTransparency = function(player_id, player_ob)
{
	if(player_ob.transparency !== ''){
        var _loc1_ = ENGINE.getPlayerMovieClip(player_id);
	    new Tween(_loc1_, "_alpha", Regular.easeOut, _loc1_._alpha, int(player_ob.transparency), 1, true);
    }
};

ENGINE.updatePlayerRotation = function(player_id, player_ob)
{
	var _loc1_ = ENGINE.getPlayerMovieClip(player_id);
	new Tween(_loc1_, "_rotation", Regular.easeOut, _loc1_._rotation, int(player_ob.rotation), 1, true);
};

AIRTOWER.UPDATE_PLAYER_NAMEGLOW = "upng";
AIRTOWER.UPDATE_PLAYER_NAMECOLOR = "upnc";
AIRTOWER.UPDATE_PLAYER_RINGCOLOR = "uprc";
AIRTOWER.UPDATE_PLAYER_SIZE = "upsi";
AIRTOWER.UPDATE_PLAYER_TRANSPARENCY = "upal";
AIRTOWER.UPDATE_PLAYER_ROTATION = "uprt";
AIRTOWER.UPDATE_PLAYER_BUBBLECOLOR = "upbc";
AIRTOWER.UPDATE_PLAYER_BUBBLETEXT = "upbt";
AIRTOWER.UPDATE_PLAYER_WALLS = "upws";
AIRTOWER.UPDATE_PLAYER_SPEED = "upsp";
AIRTOWER.UPDATE_PLAYER_MOOD = "upmd";
AIRTOWER.UPDATE_PLAYER_MOODCOLOR = "upmc";
AIRTOWER.UPDATE_PLAYER_SNOWBALL = "upsb";

AIRTOWER.addListener(AIRTOWER.UPDATE_PLAYER_NAMEGLOW, SHELL.handleSendUpdatePlayerNameglow);
AIRTOWER.addListener(AIRTOWER.UPDATE_PLAYER_NAMECOLOR, SHELL.handleSendUpdatePlayerNamecolor);
AIRTOWER.addListener(AIRTOWER.UPDATE_PLAYER_RINGCOLOR, SHELL.handleSendUpdatePlayerRingcolor);
AIRTOWER.addListener(AIRTOWER.UPDATE_PLAYER_SIZE, SHELL.handleSendUpdatePlayerSize);
AIRTOWER.addListener(AIRTOWER.UPDATE_PLAYER_TRANSPARENCY, SHELL.handleSendUpdatePlayerTransparency);
AIRTOWER.addListener(AIRTOWER.UPDATE_PLAYER_ROTATION, SHELL.handleSendUpdatePlayerRotation);
AIRTOWER.addListener(AIRTOWER.UPDATE_PLAYER_BUBBLECOLOR, SHELL.handleSendUpdatePlayerBubblecolor);
AIRTOWER.addListener(AIRTOWER.UPDATE_PLAYER_BUBBLETEXT, SHELL.handleSendUpdatePlayerBubbletext);
AIRTOWER.addListener(AIRTOWER.UPDATE_PLAYER_WALLS, SHELL.handleSendUpdatePlayerWalls);
AIRTOWER.addListener(AIRTOWER.UPDATE_PLAYER_SPEED, SHELL.handleSendUpdatePlayerSpeed);
AIRTOWER.addListener(AIRTOWER.UPDATE_PLAYER_MOOD, SHELL.handleSendUpdatePlayerMood);
AIRTOWER.addListener(AIRTOWER.UPDATE_PLAYER_MOODCOLOR, SHELL.handleSendUpdatePlayerMoodcolor);
AIRTOWER.addListener(AIRTOWER.UPDATE_PLAYER_SNOWBALL, SHELL.handleSendUpdatePlayerSnowball);

var updateNameglowViaBridge = function(color) 
{
	SHELL.sendUpdatePlayerNameglow(color);
};
var updateNamecolorViaBridge = function(color) 
{
	SHELL.sendUpdatePlayerNamecolor(color);
};
var updateRingcolorViaBridge = function(color) 
{
	SHELL.sendUpdatePlayerRingcolor(color);
};
var updateSizeViaBridge = function(size) 
{
	SHELL.sendUpdatePlayerSize(size);
};
var updateTransparencyViaBridge = function(alpha) 
{
	SHELL.sendUpdatePlayerTransparency(alpha);
};
var updateRotationViaBridge = function(degrees) 
{
	SHELL.sendUpdatePlayerRotation(degrees);
};
var updateBubblecolorViaBridge = function(color) 
{
	SHELL.sendUpdatePlayerBubblecolor(color);
};
var updateBubbletextViaBridge = function(color) 
{
	SHELL.sendUpdatePlayerBubbletext(color);
};
var updateWallsViaBridge = function(bool) 
{
	SHELL.sendUpdatePlayerWalls(bool);
};
var updateSpeedViaBridge = function(speed) 
{
	SHELL.sendUpdatePlayerSpeed(speed);
};
var updateMoodViaBridge = function(mood) 
{
	SHELL.sendUpdatePlayerMood(mood);
};
var updateMoodcolorViaBridge = function(color) 
{
	SHELL.sendUpdatePlayerMoodcolor(color);
};
var updateSnowballViaBridge = function(color) 
{
	SHELL.sendUpdatePlayerSnowball(color);
};

flash.external.ExternalInterface.addCallback("sendUpdatePlayerNameglow", null, updateNameglowViaBridge);
flash.external.ExternalInterface.addCallback("sendUpdatePlayerNamecolor", null, updateNamecolorViaBridge);
flash.external.ExternalInterface.addCallback("sendUpdatePlayerRingcolor", null, updateRingcolorViaBridge);
flash.external.ExternalInterface.addCallback("sendUpdatePlayerSize", null, updateSizeViaBridge);
flash.external.ExternalInterface.addCallback("sendUpdatePlayerTransparency", null, updateTransparencyViaBridge);
flash.external.ExternalInterface.addCallback("sendUpdatePlayerRotation", null, updateRotationViaBridge);
flash.external.ExternalInterface.addCallback("sendUpdatePlayerBubblecolor", null, updateBubblecolorViaBridge);
flash.external.ExternalInterface.addCallback("sendUpdatePlayerBubbletext", null, updateBubbletextViaBridge);
flash.external.ExternalInterface.addCallback("sendUpdatePlayerWalls", null, updateWallsViaBridge);
flash.external.ExternalInterface.addCallback("sendUpdatePlayerSpeed", null, updateSpeedViaBridge);
flash.external.ExternalInterface.addCallback("sendUpdatePlayerMood", null, updateMoodViaBridge);
flash.external.ExternalInterface.addCallback("sendUpdatePlayerMoodcolor", null, updateMoodcolorViaBridge);
flash.external.ExternalInterface.addCallback("sendUpdatePlayerSnowball", null, updateSnowballViaBridge);