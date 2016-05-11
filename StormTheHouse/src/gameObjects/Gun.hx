package gameObjects;
import flixel.group.FlxGroup;

/**
 * ...
 * @author MateoCarranza
 */
class Gun
{

	var bullets:FlxGroup;

	public function new(bullets:FlxGroup) 
	{
		this.bullets = bullets;
	}

	public function shoot(xOrigin:Float, yOrigin:Float, xDestiny:Float, yDestiny:Float):Void{
		var bullet:Bullet =cast bullets.recycle(Bullet);
		//var Xdistance:Float = this.x - previousPoint.x;
		//var Ydistance:Float = this.y - previousPoint.y;
		//var X:Float = y / (Math.tan(Math.PI*))
		bullet.resetAndShoot(xOrigin + 47, yOrigin + 30, xDestiny, yDestiny);
		
		//Math.atan2(Ydistance, Xdistance) * 180 / Math.PI = angle
	}

	}