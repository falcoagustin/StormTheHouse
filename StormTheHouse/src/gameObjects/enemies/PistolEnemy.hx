package gameObjects.enemies;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tile.FlxTilemap;
import flixel.util.FlxPath;
import gameObjects.weapons.Weapon;
import openfl.Assets;

/**
 * ...
 * @author MateoCarranza
 */
class PistolEnemy extends Enemy
{

	public function new(?X:Float = 0, ?Y:Float = 0, aGun:Weapon, map:FlxTilemap, delfaultPathRcv:Array<FlxPoint>) 
	{
		super(X,Y,aGun, map, delfaultPathRcv);
		loadGraphic(Assets.getBitmapData("img/survivor1_gun.png"), true, 49, 43);
		timeSinceLastSeen = 5;
		maximumDistanceToMirko = 350;
		timeToAtack = 1.5;
		speed = 100;
		accuracy = 35;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
}