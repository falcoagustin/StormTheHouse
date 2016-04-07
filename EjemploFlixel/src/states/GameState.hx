package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;
import gameObjects.Bullet;
import gameObjects.Gun;
import gameObjects.Player;
import gameObjects.Wall;

/**
 * ...
 * @author MateoCarranza
 */
class GameState extends FlxState
{
	var player:Player;
	var walls:FlxGroup;
	var bullets:FlxGroup;
	
	
	public function new() 
	{
		super();
	}
	
	override function create():Void
	{
		bullets = new FlxGroup();
		add(bullets);
		var gun :Gun = new Gun(bullets);
		player = new Player(100, 100, gun);
		add(player);
		
		walls = new FlxGroup();
		add(walls);
		var wall = new Wall(700, 0, 50, 480);
		walls.add(wall);
	}
	
	override function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.collide(player, walls);
		FlxG.overlap(walls, bullets, wallsVsBullets);
		
	}
	
	private function wallsVsBullets(aWall:Wall,aBullet:Bullet):Void
	{
		aBullet.kill();
	}
	
}