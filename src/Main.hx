package;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;

/**
 * ...
 * @author Mateo
 */

class Main extends Sprite 
{
	var circle:Sprite = new Sprite();
	var lastTime:Int = 0;
	var circleRadio:Float = 100;
	var speedX:Float = 100;
	var speedY:Float = 0;
	var gravity:Float = 3000;
	
	public function new() 
	{
		super();
		
		// Assets:
		// openfl.Assets.getBitmapData("img/assetname.jpg");
		
		addEventListener(Event.ADDED_TO_STAGE, init);
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	private function update(e:Event):Void 
	{
		
		var dt = (Lib.getTimer() - lastTime) / 1000;
		if (dt > 1 / 15) {
			dt = 1 / 15;
		}
		lastTime = Lib.getTimer();
		speedY  +=  gravity * dt;
		circle.x += speedX * dt;
		circle.y += speedY * dt;
		
		
		if (circle.x + circleRadio * 2 > stage.stageWidth ){
			circle.x = stage.stageWidth - circleRadio * 2 ;
			speedX = speedX * -1;
		}
		if (circle.x < 0){
			circle.x = 0;
			speedX = speedX * -1;
			
		}
		
		if (circle.y + circleRadio * 2 > stage.stageHeight ){
			circle.y = stage.stageHeight - circleRadio * 2 ;
			speedY = speedY * -1;
		}
		if (circle.y < 0){
			circle.y = 0;
			speedY = speedY * -1;
			
		}

	}
	
	private function init(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);
		var g = circle.graphics;
		g.beginFill(0x2837EE);
		g.drawCircle(100, 100, 100);
		
		
		addChild(circle);
		
		circle.x =  0;
		circle.y = 50;
	}
}
