package;
import gameObjects.Mirko;

/**
 * ...
 * @author MateoCarranza
 */

typedef GGD = GlobalGameData; 
class GlobalGameData
{
	public static var instance(get, null):GlobalGameData;
	private static var mirko:Mirko;
	private static var score:Int;
	
	private static function get_instance() : GlobalGameData
	{
		if (instance == null)
		{
			instance = new GlobalGameData();
		}
		return instance;
	}
	
	public static function clear():Void
	{
		mirko = null;
	}

	private function new() 
	{
		score = 0;
	}
	
	public function enemyKilled(points:Int):Void
	{
		
		score += points;
		
	}
	
	public function setPlayer(player:Mirko):Void
	{
		mirko = player;
	}
	
	public function getPlayer():Mirko
	{
		return mirko;
	}
	
	public function setScore(points:Int):Void
	{
		score = points;
	}
	
	public function getScore():Int
	{
		return score;
	}
	
}