package gameObjects.enemies;

import flixel.math.FlxPoint;
import flixel.tile.FlxTilemap;
import gameObjects.weapons.Gun;
import gameObjects.weapons.Shotgun;
import gameObjects.weapons.Weapon;
import openfl.Assets;

/**
 * ...
 * @author MateoCarranza
 */
class ShotgunEnemy extends Enemy
{

	public function new(?X:Float=0, ?Y:Float=0, shotgun:Weapon, map:FlxTilemap, delfaultPathRcv:Array<FlxPoint>) 
	{
		super(X, Y, shotgun, map, delfaultPathRcv);
		loadGraphic(Assets.getBitmapData("img/manBlue_machine.png"), true, 49, 43);
		timeSinceLastSeen = 5;
		maximumDistanceToMirko = 250;
		timeToAtack = 2.2;
		speed = 70;
		accuracy = 45;
	}
	
}