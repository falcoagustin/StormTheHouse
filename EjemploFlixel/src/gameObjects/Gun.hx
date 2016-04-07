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
	
	public function shoot(X:Float, Y:Float):Void{
		var bullet:Bullet =cast  bullets.recycle(Bullet);
		bullet.reset(X, Y);
	}
	
}