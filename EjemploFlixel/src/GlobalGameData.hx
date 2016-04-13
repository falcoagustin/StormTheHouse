package;
import gameObjects.Player;

/**
 * ...
 * @author MateoCarranza
 */

typedef GGD = GlobalGameData; 
class GlobalGameData
{
	public static var player:Player;
	
	public static function clear():Void
	{
		player = null;
	}

	public function new() 
	{
		
	}
	
}