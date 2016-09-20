package gameObjects.enemies;

import flixel.math.FlxPoint;
import flixel.tile.FlxTilemap;
import gameObjects.weapons.Weapon;
import openfl.Assets;

/**
 * ...
 * @author MateoCarranza
 */
class Zombie extends Enemy
{

	public function new(?X:Float=0, ?Y:Float=0, aWeapon:Weapon, map:FlxTilemap, delfaultPathRcv:Array<FlxPoint>) 
	{
		
		super(X, Y, aWeapon, map, delfaultPathRcv);
		loadGraphic(Assets.getBitmapData("img/zoimbie1_hold.png"), true, 35, 43);
		timeSinceLastSeen = 15;
		maximumDistanceToMirko = 350;
		timeToAtack = 2;
		speed = 80;
		accuracy = 0;
	}
	

	
}