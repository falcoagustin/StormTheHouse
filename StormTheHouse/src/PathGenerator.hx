package;
import flixel.math.FlxPoint;

/**
 * ...
 * @author MateoCarranza
 */
class PathGenerator
{
	var tileSize:Int;

	public function new() 
	{
		tileSize = 64;
	}
	
	private function tile(number:Int):Int
	{
		return number * tileSize +32;
	}
	
	public function demoPath():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(5) +32 , tile(6) + 32);
		var secondPoint = new FlxPoint(64 * 13 + 32, 64 * 6 + 32);
		var thirdPoint = new FlxPoint(64 * 13 + 32, 64 * 10 + 32);
		var fourthPoint = new FlxPoint(64 * 5 + 32, 64 * 10 + 32);
		
		
		var path = new Array<FlxPoint>();
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		path.push(fourthPoint);
		
		return path;
	}
	
	public function house1Enemie1():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(14), tile(17));
		var secondPoint = new FlxPoint(tile(10), tile(17));
		var thirdPoint = new FlxPoint(tile(10), tile(18));
		var fourthPoint = new FlxPoint(tile(5), tile(18));
		var fifthPoint = new FlxPoint(tile(5), tile(24));
		var sixthPoint = new FlxPoint(tile(14), tile(24));
		
		var path = new Array<FlxPoint>();
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		path.push(fourthPoint);
		path.push(fifthPoint);
		path.push(sixthPoint);
		
		return path;
	}
	
	public function house1Enemie2():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(5), tile(18));
		var secondPoint = new FlxPoint(tile(5), tile(24));
		var thirdPoint = new FlxPoint(tile(14), tile(24));
		var fourthPoint = new FlxPoint(tile(14), tile(17));
		var fifthPoint = new FlxPoint(tile(10), tile(17));
		var sixthPoint = new FlxPoint(tile(10), tile(18));
		
		var path = new Array<FlxPoint>();
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		path.push(fourthPoint);
		path.push(fifthPoint);
		path.push(sixthPoint);
		
		return path;
	}
	
	public function house1Enemie3():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(9), tile(24));
		var secondPoint = new FlxPoint(tile(14), tile(24));
		var thirdPoint = new FlxPoint(tile(14), tile(17));
		var fourthPoint = new FlxPoint(tile(10), tile(17));
		var fifthPoint = new FlxPoint(tile(10), tile(18));
		var sixthPoint = new FlxPoint(tile(5), tile(18));
		var seventhPoint = new FlxPoint(tile(5), tile(4));
		
		var path = new Array<FlxPoint>();
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		path.push(fourthPoint);
		path.push(fifthPoint);
		path.push(sixthPoint);
		
		return path;
	}
	
	public function house1Enemie4():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(19), tile(20));
		var secondPoint = new FlxPoint(tile(16), tile(20));
		var thirdPoint = new FlxPoint(tile(16), tile(24));
		var fourthPoint = new FlxPoint(tile(19), tile(24));

		
		var path = new Array<FlxPoint>();
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		path.push(fourthPoint);
		
		return path;
	}
	
	public function house1Enemie5():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(16), tile(24));
		var secondPoint = new FlxPoint(tile(19), tile(24));
		var thirdPoint = new FlxPoint(tile(19), tile(20));
		var fourthPoint = new FlxPoint(tile(16), tile(20));

		
		var path = new Array<FlxPoint>();
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		path.push(fourthPoint);
		
		return path;
	}
	
	public function house2Enemie1():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(39), tile(16));
		var secondPoint = new FlxPoint(tile(39), tile(19));
		var thirdPoint = new FlxPoint(tile(44), tile(19));
		var fourthPoint = new FlxPoint(tile(44), tile(23));
		var fifthPoint = new FlxPoint(tile(49), tile(23));
		var sixthPoint = new FlxPoint(tile(49), tile(22));
		var seventhPoint = new FlxPoint(tile(45), tile(22));
		var eighthhPoint = new FlxPoint(tile(45), tile(16));
		
		var path = new Array<FlxPoint>();
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		path.push(fourthPoint);
		path.push(fifthPoint);
		path.push(sixthPoint);
		path.push(seventhPoint);
		path.push(eighthhPoint);
		
		return path;
	}
	
	public function house2Enemie2():Array<FlxPoint>
	{
		var fourthPoint = new FlxPoint(tile(44), tile(23));
		var fifthPoint = new FlxPoint(tile(49), tile(23));
		var sixthPoint = new FlxPoint(tile(49), tile(22));
		var seventhPoint = new FlxPoint(tile(45), tile(22));
		var eighthhPoint = new FlxPoint(tile(45), tile(16));
		var firstPoint = new FlxPoint(tile(39), tile(16));
		var secondPoint = new FlxPoint(tile(39), tile(19));
		var thirdPoint = new FlxPoint(tile(44), tile(19));
		
		
		var path = new Array<FlxPoint>();
		
		path.push(fourthPoint);
		path.push(fifthPoint);
		path.push(sixthPoint);
		path.push(seventhPoint);
		path.push(eighthhPoint);
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		
		return path;
	}
	
	public function house2Enemie3():Array<FlxPoint>
	{
		var seventhPoint = new FlxPoint(tile(45), tile(22));
		var eighthhPoint = new FlxPoint(tile(45), tile(16));
		var firstPoint = new FlxPoint(tile(39), tile(16));
		var secondPoint = new FlxPoint(tile(39), tile(19));
		var thirdPoint = new FlxPoint(tile(44), tile(19));
		var fourthPoint = new FlxPoint(tile(44), tile(23));
		var fifthPoint = new FlxPoint(tile(49), tile(23));
		var sixthPoint = new FlxPoint(tile(49), tile(22));
		

		
		var path = new Array<FlxPoint>();
		
		path.push(sixthPoint);
		path.push(seventhPoint);
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		path.push(fourthPoint);
		path.push(fifthPoint);
		
		
		return path;
	}
	
	public function house2Enemie4():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(52), tile(22));
		var secondPoint = new FlxPoint(tile(54), tile(22));
		var thirdPoint = new FlxPoint(tile(54), tile(19));
		var fourthPoint = new FlxPoint(tile(52), tile(19));

		var path = new Array<FlxPoint>();
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		path.push(fourthPoint);

		return path;
	}
	
	public function house2Enemie5():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(46), tile(12));
		var secondPoint = new FlxPoint(tile(46), tile(13));
		var thirdPoint = new FlxPoint(tile(54), tile(13));
		var fourthPoint = new FlxPoint(tile(54), tile(12));

		var path = new Array<FlxPoint>();
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		path.push(fourthPoint);

		return path;
	}
	
	public function house2Enemie6():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(49), tile(16));
		var secondPoint = new FlxPoint(tile(49), tile(22));
		var thirdPoint = new FlxPoint(tile(54), tile(22));
		var fourthPoint = new FlxPoint(tile(54), tile(19));
		var fifthPoint = new FlxPoint(tile(52), tile(19));
		var sixthPoint = new FlxPoint(tile(52), tile(22));
		var seventhPoint = new FlxPoint(tile(49), tile(22));
		var eighthPoint = new FlxPoint(tile(49), tile(16));
		var ninthPoint = new FlxPoint(tile(47), tile(16));
		var tenthPoint = new FlxPoint(tile(47), tile(13));
		var eleventhPoint = new FlxPoint(tile(54), tile(13));
		var twelvethPoint = new FlxPoint(tile(54), tile(12));
		var thirteenthPoint = new FlxPoint(tile(47), tile(12));
		var fourteenthPoint = new FlxPoint(tile(47), tile(16));
		
		var path = new Array<FlxPoint>();
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		path.push(fourthPoint);
		path.push(fifthPoint);
		path.push(sixthPoint);
		path.push(seventhPoint);
		path.push(eighthPoint);
		path.push(ninthPoint);
		path.push(tenthPoint);
		path.push(eleventhPoint);
		path.push(twelvethPoint);
		path.push(thirteenthPoint);
		path.push(fourteenthPoint);
		
		return path;
	}
	
	public function house3Enemie1():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(77), tile(21));
		var secondPoint = new FlxPoint(tile(89), tile(21));
		var thirdPoint = new FlxPoint(tile(89), tile(17));
		var fourthPoint = new FlxPoint(tile(86), tile(17));
		var fifthPoint = new FlxPoint(tile(86), tile(12));
		var sixthPoint = new FlxPoint(tile(78), tile(12));
		var seventhPoint = new FlxPoint(tile(78), tile(19));
		var eighthPoint = new FlxPoint(tile(77), tile(19));

		
		var path = new Array<FlxPoint>();
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		path.push(fourthPoint);
		path.push(fifthPoint);
		path.push(sixthPoint);
		path.push(seventhPoint);
		path.push(eighthPoint);

		
		return path;
	}
	
	public function house3Enemie2():Array<FlxPoint>
	{
		var fifthPoint = new FlxPoint(tile(86), tile(12));
		var sixthPoint = new FlxPoint(tile(78), tile(12));
		var seventhPoint = new FlxPoint(tile(78), tile(19));
		var eighthPoint = new FlxPoint(tile(77), tile(19));
		var firstPoint = new FlxPoint(tile(77), tile(21));
		var secondPoint = new FlxPoint(tile(89), tile(21));
		var thirdPoint = new FlxPoint(tile(89), tile(17));
		var fourthPoint = new FlxPoint(tile(86), tile(17));


		
		var path = new Array<FlxPoint>();
		
		path.push(fifthPoint);
		path.push(sixthPoint);
		path.push(seventhPoint);
		path.push(eighthPoint);
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		path.push(fourthPoint);

		return path;
	}
	
	public function house3Enemie3():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(85), tile(19));
		var secondPoint = new FlxPoint(tile(85), tile(15));
		var thirdPoint = new FlxPoint(tile(79), tile(15));
		var fourthPoint = new FlxPoint(tile(79), tile(19));

		var path = new Array<FlxPoint>();
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		path.push(fourthPoint);

		return path;
	}
	
	public function house3Enemie4():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(89), tile(12));
		var secondPoint = new FlxPoint(tile(89), tile(15));
		var thirdPoint = new FlxPoint(tile(95), tile(15));
		var fourthPoint = new FlxPoint(tile(95), tile(12));

		var path = new Array<FlxPoint>();
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		path.push(fourthPoint);

		return path;
	}
	
	public function house3Enemie5():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(92), tile(15));
		var secondPoint = new FlxPoint(tile(92), tile(22));
		var thirdPoint = new FlxPoint(tile(95), tile(22));
		var fourthPoint = new FlxPoint(tile(95), tile(15));

		var path = new Array<FlxPoint>();
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		path.push(fourthPoint);

		return path;
	}
	
	public function house3Enemie6():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(94), tile(7));
		var secondPoint = new FlxPoint(tile(88), tile(7));
		var thirdPoint = new FlxPoint(tile(88), tile(9));
		var fourthPoint = new FlxPoint(tile(94), tile(9));

		var path = new Array<FlxPoint>();
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		path.push(fourthPoint);

		return path;
	}
	
	public function house3Enemie7():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(88), tile(9));
		var secondPoint = new FlxPoint(tile(94), tile(9));
		var thirdPoint = new FlxPoint(tile(94), tile(7));
		var fourthPoint = new FlxPoint(tile(88), tile(7));

		var path = new Array<FlxPoint>();
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		path.push(fourthPoint);

		return path;
	}
	
	public function house4Enemie1():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(46), tile(42));
		var secondPoint = new FlxPoint(tile(46), tile(45));
		var thirdPoint = new FlxPoint(tile(40), tile(45));
		var fourthPoint = new FlxPoint(tile(51), tile(45));
		var fifthPoint = new FlxPoint(tile(51), tile(42));

		var path = new Array<FlxPoint>();
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		path.push(fourthPoint);
		path.push(fifthPoint);

		return path;
	}
	
	public function house4Enemie2():Array<FlxPoint>
	{
		var fifthPoint = new FlxPoint(tile(51), tile(42));
		var firstPoint = new FlxPoint(tile(46), tile(42));
		var secondPoint = new FlxPoint(tile(46), tile(45));
		var thirdPoint = new FlxPoint(tile(40), tile(45));
		var fourthPoint = new FlxPoint(tile(51), tile(45));

		var path = new Array<FlxPoint>();
		path.push(fifthPoint);
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		path.push(fourthPoint);
		

		return path;
	}
	
	public function house4Enemie3():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(44), tile(40));
		var secondPoint = new FlxPoint(tile(39), tile(40));
		var thirdPoint = new FlxPoint(tile(39), tile(44));
		var fourthPoint = new FlxPoint(tile(39), tile(40));

		var path = new Array<FlxPoint>();
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		path.push(fourthPoint);

		return path;
	}
	
	public function house4Enemie4():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(39), tile(49));
		var secondPoint = new FlxPoint(tile(39), tile(59));

		var path = new Array<FlxPoint>();
		path.push(firstPoint);
		path.push(secondPoint);

		return path;
	}
	
	public function house4Enemie5():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(40), tile(56));
		var secondPoint = new FlxPoint(tile(0), tile(48));

		var path = new Array<FlxPoint>();
		path.push(firstPoint);
		path.push(secondPoint);

		return path;
	}
	
	public function house4Enemie6():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(44), tile(57));

		var path = new Array<FlxPoint>();
		path.push(firstPoint);

		return path;
	}
	
	public function house4Enemie7():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(47), tile(59));
		var secondPoint = new FlxPoint(tile(47), tile(52));
		var thirdPoint = new FlxPoint(tile(43), tile(52));
		var fourthPoint = new FlxPoint(tile(43), tile(49));
		var fifthPoint = new FlxPoint(tile(50), tile(49));
		var sixthPoint = new FlxPoint(tile(50), tile(59));
		var seventhPoint = new FlxPoint(tile(50), tile(48));
		var eighthPoint = new FlxPoint(tile(43), tile(48));
		var ninthPoint = new FlxPoint(tile(43), tile(52));
		var tenthPoint = new FlxPoint(tile(47), tile(52));

		
		var path = new Array<FlxPoint>();
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		path.push(fourthPoint);
		path.push(fifthPoint);
		path.push(sixthPoint);
		path.push(seventhPoint);
		path.push(eighthPoint);
		path.push(ninthPoint);
		path.push(tenthPoint);
		
		return path;
	}
	
	public function house4Enemie8():Array<FlxPoint>
	{
		var sixthPoint = new FlxPoint(tile(50), tile(59));
		var seventhPoint = new FlxPoint(tile(50), tile(48));
		var eighthPoint = new FlxPoint(tile(43), tile(48));
		var ninthPoint = new FlxPoint(tile(43), tile(52));
		var tenthPoint = new FlxPoint(tile(47), tile(52));
		var firstPoint = new FlxPoint(tile(47), tile(59));
		var secondPoint = new FlxPoint(tile(47), tile(52));
		var thirdPoint = new FlxPoint(tile(43), tile(52));
		var fourthPoint = new FlxPoint(tile(43), tile(49));
		var fifthPoint = new FlxPoint(tile(50), tile(49));
		
		var path = new Array<FlxPoint>();
		path.push(sixthPoint);
		path.push(seventhPoint);
		path.push(eighthPoint);
		path.push(ninthPoint);
		path.push(tenthPoint);
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		path.push(fourthPoint);
		path.push(fifthPoint);
		
		
		return path;
	}
	
	public function house4Enemie9():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(55), tile(49));
		var secondPoint = new FlxPoint(tile(55), tile(59));

		var path = new Array<FlxPoint>();
		path.push(firstPoint);
		path.push(secondPoint);

		return path;
	}
	
	public function house4Enemie10():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(56), tile(59));
		var secondPoint = new FlxPoint(tile(56), tile(49));

		var path = new Array<FlxPoint>();
		path.push(firstPoint);
		path.push(secondPoint);

		return path;
	}
	
	public function house4Enemie11():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(54), tile(42));

		var path = new Array<FlxPoint>();
		path.push(firstPoint);

		return path;
	}
	
	public function house4Enemie12():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(55), tile(42));

		var path = new Array<FlxPoint>();
		path.push(firstPoint);

		return path;
	}
	
	public function house4Enemie13():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(56), tile(42));

		var path = new Array<FlxPoint>();
		path.push(firstPoint);

		return path;
	}
	
	public function house4Enemie14():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(tile(57), tile(42));

		var path = new Array<FlxPoint>();
		path.push(firstPoint);

		return path;
	}
}