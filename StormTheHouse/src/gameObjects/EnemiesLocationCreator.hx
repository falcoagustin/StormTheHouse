package gameObjects;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;
import flixel.util.FlxPath;
import gameObjects.enemies.Enemy;
import gameObjects.enemies.PistolEnemy;
import gameObjects.weapons.Gun;
import gameObjects.weapons.Shotgun;
import gameObjects.weapons.Weapon;
import gameObjects.weapons.ZombieGrab;

/**
 * ...
 * @author MateoCarranza
 */
class EnemiesLocationCreator
{
	var tileSize:Int;
	var pathGenerator:PathGenerator;

	public function new() 
	{
		tileSize = 64;
		pathGenerator = new PathGenerator();
	}
	
	public function initialEnemies(): Array<Array<FlxPoint>>
	{
		var paths:Array<Array<FlxPoint>> = new Array<Array<FlxPoint>>();
		var house1Enemie1 = pathGenerator.house1Enemie1();
		var house1Enemie2 = pathGenerator.house1Enemie2();
		var house1Enemie3 = pathGenerator.house1Enemie3();
		var house1Enemie4 = pathGenerator.house1Enemie4();
		var house1Enemie5 = pathGenerator.house1Enemie5();
		var house2Enemie1 = pathGenerator.house2Enemie1();
		var house2Enemie2 = pathGenerator.house2Enemie2();
		var house2Enemie3 = pathGenerator.house2Enemie3();
		var house2Enemie4 = pathGenerator.house2Enemie4();
		var house2Enemie5 = pathGenerator.house2Enemie5();
		var house2Enemie6 = pathGenerator.house2Enemie6();
		var house3Enemie1 = pathGenerator.house3Enemie1();
		var house3Enemie2 = pathGenerator.house3Enemie2();
		var house3Enemie3 = pathGenerator.house3Enemie3();
		var house3Enemie4 = pathGenerator.house3Enemie4();
		var house3Enemie5 = pathGenerator.house3Enemie5();
		var house3Enemie6 = pathGenerator.house3Enemie6();
		var house3Enemie7 = pathGenerator.house3Enemie7();
		var house4Enemie1 = pathGenerator.house4Enemie1();
		var house4Enemie2 = pathGenerator.house4Enemie2();
		var house4Enemie3 = pathGenerator.house4Enemie3();
		var house4Enemie4 = pathGenerator.house4Enemie4();
		var house4Enemie5 = pathGenerator.house4Enemie5();
		var house4Enemie6 = pathGenerator.house4Enemie6();
		var house4Enemie7 = pathGenerator.house4Enemie7();
		var house4Enemie8 = pathGenerator.house4Enemie8();
		var house4Enemie9 = pathGenerator.house4Enemie9();
		var house4Enemie10 = pathGenerator.house4Enemie10();
		var house4Enemie11 = pathGenerator.house4Enemie11();
		var house4Enemie12 = pathGenerator.house4Enemie12();
		var house4Enemie13 = pathGenerator.house4Enemie13();
		var house4Enemie14 = pathGenerator.house4Enemie13();
	
		
		paths.push(house1Enemie1);
		paths.push(house1Enemie2);
		paths.push(house1Enemie3);
		paths.push(house1Enemie4);
		paths.push(house1Enemie5);
		paths.push(house2Enemie1);
		paths.push(house2Enemie2);
		paths.push(house2Enemie3);
		paths.push(house2Enemie4);
		paths.push(house2Enemie5);
		paths.push(house2Enemie6);
		paths.push(house3Enemie1);
		paths.push(house3Enemie2);
		paths.push(house3Enemie3);
		paths.push(house3Enemie4);
		paths.push(house3Enemie5);
		paths.push(house3Enemie6);
		paths.push(house3Enemie7);
		paths.push(house4Enemie1);
		paths.push(house4Enemie2);
		paths.push(house4Enemie3);
		paths.push(house4Enemie4);
		paths.push(house4Enemie5);
		paths.push(house4Enemie6);
		paths.push(house4Enemie7);
		paths.push(house4Enemie8);
		paths.push(house4Enemie9);
		paths.push(house4Enemie10);
		paths.push(house4Enemie11);
		paths.push(house4Enemie12);
		paths.push(house4Enemie13);
		paths.push(house4Enemie14);
		
		return paths;
	}
	
	private function tile(number:Int):Int
	{
		return number * tileSize;
	}
	
	public function callTheZombies():Array<FlxPoint>
	{
		var mirkoX = GlobalGameData.instance.getPlayer().x;
		var mirkoY = GlobalGameData.instance.getPlayer().y;
		
		var locations = new Array<FlxPoint>();
		for (i in 0...5)
		{
			var loc1 = new FlxPoint(mirkoX + tile(i * 5) - tile(12), mirkoY - tile(12));
			var loc2 = new FlxPoint(mirkoX + tile(i * 5) - tile(12), mirkoY + tile(12));
			var loc3 = new FlxPoint(mirkoX - tile(12), mirkoY + tile(i*5) + tile(12));
			var loc4 = new FlxPoint(mirkoX + tile(12), mirkoY + tile(i*5) + tile(12));

			locations.push(loc1);
			locations.push(loc2);
			locations.push(loc3);
			locations.push(loc4);
			
		}
		return locations;
	}
	
	

	
}