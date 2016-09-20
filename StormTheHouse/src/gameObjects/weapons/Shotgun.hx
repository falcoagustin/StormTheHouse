package gameObjects.weapons;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.util.FlxTimer;

/**
 * ...
 * @author MateoCarranza
 */
class Shotgun extends Weapon
{

	var bullets:FlxGroup;
	var timeSinceLastShot:Float;
	
	public function new(aBullets:FlxGroup) 
	{
		bullets = aBullets;
		timeSinceLastShot = 0;
	}
	
	override public function atack(xOrigin:Float, yOrigin:Float, xDestiny:Float, yDestiny:Float, accuracy:Int):Void{
		var now = Date.now().getTime();
		if ( now - timeSinceLastShot > 1500){
			timeSinceLastShot = now;
			for (i in 0...4)
			{
				var bullet:Bullet = cast bullets.recycle(Bullet);
				if (accuracy == 0){
					accuracy = 40;
				}
				bullet.resetAndShoot(xOrigin + 47, yOrigin + 30, xDestiny + ((Math.random()-0.5) * accuracy*2) , yDestiny + ((Math.random()-0.5) * accuracy*2));
				
			}
		}
	}

}