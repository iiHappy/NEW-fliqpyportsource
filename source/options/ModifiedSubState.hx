package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

using StringTools;

class ModifiedSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Modified Settings';
		rpcTitle = 'Going to Psych Engine Modified Settings'; //for Discord Rich Presence

		//var option:Option = new Option('Camera Moving With Animations',
			//'If unchecked, Note Following will be disabled. (NOTE: STILL IN BETA)',
			//'noteMovement',
			//'bool',
			//true);
		//addOption(option); -disabled because of glitchy stuff. using lua note cam move now

		var option:Option = new Option('Shaders',
			'If unchecked, Shaders will be disabled.',
			'shaders',
			'bool',
			true);
		addOption(option);

		super();
	}
}