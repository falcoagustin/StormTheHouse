/*package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import gameObjects.Bullet;
import gameObjects.Gun;
import gameObjects.Jason;
import gameObjects.Player;
import gameObjects.Wall;
import openfl.Assets;
import AssetPaths;


class GameState extends FlxState
{
	var player:Player;
	var walls:FlxGroup;
	var bullets:FlxGroup;
	var jason :Jason;
	var map:FlxTilemap;
	
	
	public function new() 
	{
		super();
	}
	
	override function create():Void
	{
		
		map = new FlxTilemap();
		map.loadMapFromCSV(Assets.getText(AssetPaths.BasicMap__csv), Assets.getBitmapData(AssetPaths.tiles__png), 32, 32);
		add(map);
		
		bullets = new FlxGroup();
		add(bullets);
		var gun :Gun = new Gun(bullets);
		player = new Player(100, 100, gun);
		add(player);
		
		
		GlobalGameData.player = player;
		
		jason = new Jason(500, 200);
		add(jason);
		
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
		FlxG.overlap(bullets, jason, bulletVsJason);
		
	}
	
	private function wallsVsBullets(aWall:Wall,aBullet:Bullet):Void
	{
		aBullet.kill();
		
	}
	override public function destroy():Void
	{
		GlobalGameData.clear();
	}
	
	private function bulletVsJason(aBullet:Bullet, aJason:Jason):Void
	{
		aBullet.kill();
		aJason.damage(1);
	}
	
}
*/

package states;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.tile.FlxTilemap;
import openfl.Assets;

class GameState extends FlxState
{

	var mMap:FlxTilemap;

	public function new() 
	{
		super();
		
		
	}
	override public function create():Void 
	{
		mMap = new FlxTilemap();
		mMap.loadMapFromCSV(Assets.getText("img/BasicMap.csv"), Assets.getBitmapData("img/tilesheet_complete.png"), 64, 64,null,0,0);
		add(mMap);
		
	}
	override public function update(aDelta:Float):Void 
	{
		super.update(aDelta);

	}
	
	
	
}

