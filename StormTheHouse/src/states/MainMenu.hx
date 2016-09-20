package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import openfl.Assets;

/**
 * ...
 * @author MateoCarranza
 */
class MainMenu extends FlxState
{

	private var title = "Storm the House";
	private var titleText:FlxText;
	private var newGameButton:FlxButton;
	
	
	public function new() 
	{
		super();

	}
	
	
	override public function create():Void 
	{
		titleText = new FlxText(300, 200, 700, title, 22);
		newGameButton = new FlxButton(370, 250, "New Game", startNewGame);
		//newGameButton.loadGraphic(Assets.getText("ui/buttonLong_blue.png"));
		add(titleText);
		add(newGameButton);
		FlxG.camera.bgColor = 0xFF999999;
		
		var descripcion = "Mirko se encuentra en un pueblo lleno de amenazas, agentes especiales, zombies, robots.\n Elimina a todos los posibles. A Mirko le gusta el vodka, dice que le da energia. Su arma favorita es la kalashnikov";
	}
	private function startNewGame():Void
	{
		FlxG.switchState(new MainGameState());
	}
	
}