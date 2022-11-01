package;

import flixel.ui.FlxBar;
import openfl.filters.ShaderFilter;
#if sys
import sys.io.File;
#end
import flixel.text.*;
import openfl.utils.Assets;
import openfl.utils.AssetType;
import haxe.Json;
import haxe.format.JsonParser;
import openfl.Assets;
import openfl.utils.ByteArray;
// import Achievements.MedalSaves;
import haxe.io.Bytes;
import flixel.addons.api.FlxGameJolt;
import flixel.input.gamepad.FlxGamepad;
import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.addons.ui.FlxUIInputText;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
#if sys
import sys.FileSystem;
#end
#if newgrounds
import io.newgrounds.NG;
#end
import lime.app.Application;
#if cpp
import sys.thread.Thread;
#end
#if desktop
import Discord.DiscordClient;
#end

using StringTools;

class DaMessage extends MusicBeatState {
	//public var logoAnim:FlxSprite;
	public var loadingMush:FlxSprite;
	public var loadedTxt:FlxText;
	var boolOne:Bool = true;
	var boolTwo:Bool = true;
	var iscompleted:Bool = true;
	var fuck:Bool = false;

	override function create() {
		//PlayerSettings.init();

		FlxG.game.focusLostFramerate = 60;
		// FlxG.sound.muteKeys = muteKeys;
		// FlxG.sound.volumeDownKeys = volumeDownKeys;
		// FlxG.sound.volumeUpKeys = volumeUpKeys;
		#if desktop
		FlxG.keys.preventDefaultKeys = [TAB];
		#end

		PlayerSettings.init();
		ClientPrefs.loadPrefs();

		Highscore.load();
		#if android
		FlxG.android.preventDefaultKeys = [BACK];
		#end

		loadingMush = new FlxSprite().loadGraphic(Paths.image("tittlestuff/flippytitle-1"));
		loadingMush.scale.set(1,1);
		loadingMush.screenCenter();
		add(loadingMush);


		loadedTxt = new FlxText(400, 250, FlxG.width - 600, "this message is not supposed to show up. please restart the game.", 32);
		loadedTxt.setFormat(Paths.font("htf.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		loadedTxt.scrollFactor.set();
		loadedTxt.borderSize = 1.25;
		loadedTxt.screenCenter();
		loadedTxt.y -= 100;
		add(loadedTxt);

		loadedTxt.text = "PRELOADED ASSETS: 0";
		fuck = true;
		iscompleted = true;

		//trace(SysPathing.getExePath("do NOT readme.txt"));

		super.create();
	}
	
	override public function update(h:Float) {
		super.update(h);

		if (iscompleted) { //  && boolOne && boolTwo
				loadedTxt.text = "This Mod IS NOT recommended to new players. Programmed by WheresHappy\nIf you see a song freeze, press the reset button.\n\nPress ENTER to continue\n";
			if (FlxG.keys.justPressed.ENTER) {
				MusicBeatState.switchState(new FlashingState());
			}
		}
		if (loadedTxt != null && fuck && !iscompleted) {
			loadedTxt.text = "LOADED ASSETS";
		}
	}
}