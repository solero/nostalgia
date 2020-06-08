var SHELL = _global.getCurrentShell();
var ENGINE = _global.getCurrentEngine();
var INTERFACE = _global.getCurrentInterface();
var AIRTOWER = _global.getCurrentAirtower();
import mx.transitions.Tween;
import mx.transitions.easing.*;
var SPLIT_CHAR = "|";
function log(message)
{
   flash.external.ExternalInterface.call("console.log","[NEWCP]",message);
}

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

SHELL.makePlayerObjectFromString = function(raw_string)
{
    var player_string = raw_string.split(SPLIT_CHAR);
    var __reg17 = Number(player_string[2]);
    var penguin_obj = new com.clubpenguin.model.vo.PlayerVO();
    penguin_obj.player_id = Number(player_string[0]);
    penguin_obj.username = String(player_string[1]);
    penguin_obj.colour_id = Number(player_string[3]) || 0;
	//penguin_obj.colour_id = 11;
    penguin_obj.head = Number(player_string[4]) || 0;
    penguin_obj.face = Number(player_string[5]) || 0;
    penguin_obj.neck = Number(player_string[6]) || 0;
    penguin_obj.body = Number(player_string[7]) || 0;
    penguin_obj.hand = Number(player_string[8]) || 0;
    penguin_obj.feet = Number(player_string[9]) || 0;
    penguin_obj.flag_id = Number(player_string[10]) || 0;
    penguin_obj.photo_id = Number(player_string[11]) || 0;
    penguin_obj.x = Number(player_string[12]) || 0;
    penguin_obj.y = Number(player_string[13]) || 0;
    penguin_obj.frame = Number(player_string[14]) || 0;
    penguin_obj.membershipEnum = Number(player_string[15]);
    penguin_obj.is_member = Boolean(Number(player_string[15]) || 0);
    penguin_obj.total_membership_days = Number(player_string[16]) || 0;
    var __reg14 = Number(player_string[17]) || 0;
    var __reg20 = String(player_string[18]) || 0;
    var __reg5 = ENGINE.avatarManager.model.createAvatarFromTemplate(__reg14);
    penguin_obj.avatarVO = __reg5;
    penguin_obj.partyInfo = player_string[19].split(",") || 0;
    penguin_obj.puffle_id = Number(player_string[20]) || 0;
    penguin_obj.puffle_head_item_id = Number(player_string[23]) || 0;
	var offset = player_string.length == 38 ? 4 : 0;
	penguin_obj.nameglow = player_string[21+offset];
	penguin_obj.namecolor = player_string[22+offset] || 0;
	penguin_obj.bubblecolor = player_string[23+offset] || 0;
	penguin_obj.bubbletext = player_string[24+offset] || 0;
	penguin_obj.ringcolor = player_string[25+offset];
	penguin_obj.obese = player_string[26+offset];
	penguin_obj.transparency = player_string[27+offset];
	penguin_obj.rotation = Number(player_string[28+offset]) || 0;
	penguin_obj.walls = Boolean(Number(player_string[29+offset]) || 0);
	penguin_obj.speed = Number(player_string[30+offset]) || 0;
	penguin_obj.mood = player_string[31+offset];
	penguin_obj.moodcolor = player_string[32+offset] || 0;
	penguin_obj.snowball = Number(player_string[33+offset]) || 0;
    var __reg4 = Number(player_string[20]);
    if (offset == 4) 
    {
        if (SHELL.isMyPlayer(penguin_obj.player_id)) 
        {
            var __reg7 = SHELL.puffleManager.getMyPuffleById(__reg4);
            if (__reg7) 
            {
                penguin_obj.attachedPuffle = SHELL.puffleManager.getMyPuffleById(__reg4);
                SHELL.puffleManager.setCurrentWalkingId(__reg4);
                SHELL.saveMyWalkingPuffleSavedObject();
            }
        }
        else 
        {
            var __reg10 = __reg4;
            var __reg18 = Number(player_string[21]);
            var __reg19 = Number(player_string[22]);
            var __reg6 = null;
            var __reg16 = null;
            var __reg11 = null;
            var __reg15 = null;
            var __reg13 = null;
            var __reg9 = null;
            var __reg12 = Number(player_string[23]);
            var __reg8 = Number(player_string[24]);
            var __reg3 = new Array();
            __reg3.push(__reg10);
            __reg3.push(__reg18);
            __reg3.push(__reg19);
            __reg3.push(__reg6);
            __reg3.push(__reg16);
            __reg3.push(__reg11);
            __reg3.push(__reg15);
            __reg3.push(__reg13);
            __reg3.push(__reg9);
            __reg3.push(__reg12);
            __reg3.push(__reg8);
            penguin_obj.attachedPuffle = SHELL.puffleManager.makePuffleModelFromCrumb(__reg3);
        }
    }
    penguin_obj.frame_hack = SHELL.buildFrameHacksString(penguin_obj);
    penguin_obj.thrownSnowballInCurrentRoom = false;
    penguin_obj.emoteIDDisplayedInCurrentRoom = -1;
    penguin_obj.mascot_id = SHELL.getMascotIdByPlayerId(penguin_obj.playerId);
    if (SHELL.isMyPlayer(penguin_obj.player_id)) 
    {
        SHELL.getMyPlayerObject().avatarVO = __reg5;
    }
    if (SHELL.isValidString(penguin_obj.username)) 
    {
        penguin_obj.nickname = com.clubpenguin.util.Localization.getLocalizedNickname(penguin_obj.player_id, penguin_obj.username, __reg17, SHELL.getLanguageBitmask());
    }
    else if (isPlayerMascotById(penguin_obj.player_id)) 
    {
        penguin_obj.nickname = SHELL.getMascotNicknameByID(penguin_obj.player_id);
    }
    SHELL.updateActionFrames(penguin_obj);
    return penguin_obj;
}
ENGINE.updatePlayer = function(player_ob)
{
   var _loc3_ = player_ob.player_id;
   var _loc1_ = ENGINE.getPlayerMovieClip(_loc3_);
   if(_loc1_.frame > SHELL.DANCE_FRAME && _loc1_.frame != SHELL.JUMP_IN_DANCE_FRAME && _loc1_.frame != SHELL.JUMP_OUT_DANCE_FRAME)
   {
      _loc1_.frame = 1;
   }
   if(_loc1_.colour_id != player_ob.colour_id)
   {
      ENGINE.updateColour(_loc1_.art_mc.body,player_ob.colour_id);
      _loc1_.colour_id = player_ob.colour_id;
   }
   if(!ENGINE.isPlayerTransformedIntoPuffle(player_ob))
   {
      ENGINE.updatePlayerItem(_loc1_,player_ob,"book",ENGINE.BOOK_LAYER);
      ENGINE.updatePlayerItem(_loc1_,player_ob,"head",ENGINE.HEAD_LAYER);
      ENGINE.updatePlayerItem(_loc1_,player_ob,"face",ENGINE.FACE_LAYER);
      ENGINE.updatePlayerItem(_loc1_,player_ob,"neck",ENGINE.NECK_LAYER);
      ENGINE.updatePlayerItem(_loc1_,player_ob,"body",ENGINE.BODY_LAYER);
      ENGINE.updatePlayerItem(_loc1_,player_ob,"feet",ENGINE.FEET_LAYER);
	  ENGINE.updatePlayerFrame(_loc3_,_loc1_.frame);
	  ENGINE.updatePlayerNameglow(_loc3_, player_ob);
	  ENGINE.updatePlayerNamecolor(_loc3_, player_ob);
	  ENGINE.updatePlayerRingcolor(_loc3_, player_ob);
	  ENGINE.updatePlayerSize(_loc3_, player_ob);
	  ENGINE.updatePlayerTransparency(_loc3_, player_ob);
	  ENGINE.updatePlayerRotation(_loc3_, player_ob);
	  
      var _loc4_ = SHELL.getPlayerObjectById(_loc3_).hand;
      if(com.clubpenguin.world.rooms.common.skateboard.SkateboardConstants.isSkateboard(_loc4_))
      {
         var _loc5_ = ENGINE.getPlayerMovieClip(player_ob.player_id);
         var _loc6_ = _loc5_.art_mc.getDepth();
         ENGINE.updatePlayerItem(_loc1_,player_ob,"hand",_loc6_ - 1);
      }
      else
      {
         ENGINE.updatePlayerItem(_loc1_,player_ob,"hand",ENGINE.HAND_LAYER);
      }
   }
   ENGINE.updatePlayerFrame(_loc3_,_loc1_.frame);
}
ENGINE.updatePlayerNameglow = function(player_id, player_ob) 
{
	if(player_ob.nameglow !== '0'){
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
	if(player_ob.ringcolor !== '0'){
        var _loc1_ = ENGINE.room_mc.load_mc["p" + player_id].art_mc.ring;
        _loc1_._visible = true;
        var _loc2_:Color = new Color(_loc1_);
        _loc2_.setRGB(player_ob.ringcolor);
    }
};

ENGINE.updatePlayerSize = function(player_id, player_ob)
{
	if(player_ob.obese !== '0'){
		var _loc1_ = ENGINE.getPlayerMovieClip(player_id);
		new Tween(_loc1_, "_xscale", Regular.easeOut, _loc1_._xscale, int(player_ob.obese), 1, true);
		new Tween(_loc1_, "_yscale", Regular.easeOut, _loc1_._yscale, int(player_ob.obese), 1, true);
	}
};

ENGINE.updatePlayerTransparency = function(player_id, player_ob)
{
	if(player_ob.transparency !== '0'){
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

System.security.allowDomain("*");
