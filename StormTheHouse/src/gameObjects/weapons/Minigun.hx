package gameObjects.weapons;

/**
 * ...
 * @author MateoCarranza
 */
class Minigun extends Weapon
{

	public function new() 
	{
		
	}
	
	override public function atack(xOrigin:Float, yOrigin:Float, xDestiny:Float, yDestiny:Float, accuracy:Int):Void{
		var bullet:Bullet =cast bullets.recycle(Bullet);
		bullet.resetAndShoot(xOrigin + 47, yOrigin + 30, xDestiny + ((Math.random()-0.5) * accuracy*2) , yDestiny + ((Math.random()-0.5) * accuracy*2));
	}
	
}