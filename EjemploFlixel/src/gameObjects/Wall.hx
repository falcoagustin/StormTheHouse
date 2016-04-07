package gameObjects;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author MateoCarranza
 */
class Wall extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0,Width:Int,Hight:Int) 
	{
		super(X, Y);
		
		makeGraphic(Width, Hight, FlxColor.BLUE);
		immovable = true;
	}
	
}