package gameObjects.freeWeapons;

import flixel.system.FlxAssets.FlxGraphicAsset;
import openfl.Assets;

/**
 * ...
 * @author MateoCarranza
 */
class FreeGun extends FreeWeapon
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(Assets.getBitmapData("img/gun.png"), false, 41, 34);
		this.setGraphicSize(41, 34);
		this.updateHitbox();
	}
	
	override public function getWeapon():String
	{
		return "gun";
	}
}