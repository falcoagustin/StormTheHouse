package gameObjects.weapons;
import flixel.group.FlxGroup;
import gameObjects.MeleeHitbox;
import gameObjects.Mirko;
import states.GameState;

/**
 * ...
 * @author MateoCarranza
 */
class ZombieGrab extends Weapon
{

	var enemiesHitbox:FlxGroup;
	
	public function new(hitboxes:FlxGroup) 
	{
		enemiesHitbox = hitboxes;
	}
	
	override public function atack(xOrigin:Float, yOrigin:Float, xDestiny:Float, yDestiny:Float, accuracy:Int):Void{
		
		var deltaX = xDestiny - xOrigin;
		var deltaY = yDestiny - yOrigin;
		var distance = Math.sqrt(deltaX * deltaX + deltaY * deltaY);
		if (distance < 100) 
		{
			var hitbox:MeleeHitbox =cast enemiesHitbox.recycle(MeleeHitbox);
			hitbox.reset(xOrigin,yOrigin);
		}
		
	}
	
}