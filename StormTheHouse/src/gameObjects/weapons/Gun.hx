package gameObjects.weapons;
import flixel.group.FlxGroup;
import gameObjects.weapons.Weapon;

/**
 * ...
 * @author MateoCarranza
 */
class Gun extends Weapon
{
	var bullets:FlxGroup;

	public function new(aBullets:FlxGroup) 
	{
		bullets = aBullets;
	}

	override public function atack(xOrigin:Float, yOrigin:Float, xDestiny:Float, yDestiny:Float, accuracy:Int):Void{
		
		var bullet:Bullet = cast bullets.recycle(Bullet);
		
		var xDelta = xDestiny - xOrigin;
		var yDelta = yDestiny - yOrigin;
		var angle = Math.atan2(yDelta, xDelta) * 180 / Math.PI;
		
		xOrigin = xOrigin + 47 * ((Math.cos(angle) + 1) /2);
		yOrigin = yOrigin + 30 * ((Math.sin(angle) + 1) /2);
		bullet.resetAndShoot(xOrigin, yOrigin, xDestiny + ((Math.random()-0.5) * accuracy*2) , yDestiny + ((Math.random()-0.5) * accuracy*2));
	}

}