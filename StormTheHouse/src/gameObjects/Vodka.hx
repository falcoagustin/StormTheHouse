package gameObjects;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import openfl.Assets;

/**
 * ...
 * @author MateoCarranza
 */
class Vodka extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(Assets.getBitmapData("img/vodka.png"), true, 15, 50);
	}
	
}