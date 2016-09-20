package gameObjects;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import gameObjects.weapons.Weapon;
import openfl.Assets;
import openfl.events.MouseEvent;

/**
 * ...
 * @author MateoCarranza
 */
class Mirko extends FlxSprite
{
	static private inline var ACCELERATION:Float = 1000;
	static private inline var SPEED:Float = 500;
	var weapon:Weapon;
	var hp:Int;

	
	public function new(?X:Float=0, ?Y:Float=0, aWeapon:Weapon) 
	{
		super(X, Y);
		makeGraphic(50, 50);
		maxVelocity.set(400, 400);
		drag.set(500, 500);
		weapon = aWeapon;
		loadGraphic(Assets.getBitmapData("img/manOld_gun.png"), true, 49, 43);
		hp = 5;

	}

	override function update(elapsed:Float):Void
	{
		//acceleration.set();
		velocity.set();
		if (FlxG.keys.pressed.A){
			velocity.x -= SPEED;
		}
		if (FlxG.keys.pressed.D){
			velocity.x += SPEED;
		}
		if (FlxG.keys.pressed.S){
			velocity.y += SPEED;
		}
		if (FlxG.keys.pressed.W){
			velocity.y -= SPEED;
		}
		if (FlxG.mouse.get_justPressed()){
			weapon.atack(x, y, FlxG.mouse.x, FlxG.mouse.y, 0);
			//FlxG.sound.play(Assets.getText("sound/9mm.mp3"));
		}


		var Xdistance:Float = FlxG.mouse.x - this.x;
		var Ydistance:Float = FlxG.mouse.y - this.y;
		this.angle = Math.atan2(Ydistance, Xdistance) * 180 / Math.PI;

		super.update(elapsed);
	}
	
	public function removeHP(amount:Int):Void
	{
		hp -= amount;
	}
	
	public function get_HP():Int
	{
		return hp;
	}
	
	public function setHp(amount:Int):Void
	{
		hp = amount;
	}

	public function setWeapon(aWeapon:Weapon)
	{
		weapon = aWeapon;
	}

}
