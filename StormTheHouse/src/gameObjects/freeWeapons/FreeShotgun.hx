package gameObjects.freeWeapons;

import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import openfl.Assets;

/**
 * ...
 * @author MateoCarranza
 */
class FreeShotgun extends FreeWeapon
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(Assets.getBitmapData("img/shotgun.png"), false, 70, 28);
		this.setGraphicSize(70, 28);
		this.updateHitbox();
		
	}
	
	override public function getWeapon():String
	{
		return "shotgun";
	}
	
}