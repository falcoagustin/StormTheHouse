package ;
import flixel.FlxObject;
import flixel.tile.FlxTilemap;


class Tray extends FlxObject
{
	private var mMap:FlxTilemap;
	private inline static var TOPTILE:Int = 12;
	private inline static var LEFTTILE:Int = 10;
	private inline static var RIGHTTILE:Int = 9;
	private inline static var SIDESTILE:Int = 8;
	private inline static var TOPRIGHTTILE:Int = 6;
	private inline static var TOPLEFTTILE:Int = 7;
	private inline static var ALLTILE:Int = 11;
	
	
	private inline static var EMPTY:Int = -1;
	private inline static var GRASS0:Int = 0;
	private inline static var GRASS1:Int = 1;
	private inline static var GRASS2:Int = 2;
	private inline static var GRASS3:Int = 3;
	private inline static var HORIZONTALWALL:Int = 110;
	private inline static var VERTICALWALL:Int = 137;
	private inline static var TOPLEFTCORNERWALL:Int = 108;
	private inline static var BOTTOMLEFTCORNERWALL:Int = 135;
	private inline static var BOTTOMRIGHTCORNERWALL:Int = 136;
	private inline static var HORIZONTALLEFTENDWALL:Int = 113;
	private inline static var HORIZONTALRIGHTENDWALL:Int = 141;
	
	
	public function new(aMap:FlxTilemap) 
	{
		super();
		mMap = aMap;
	}
	public function setContactPosition(x:Float, y:Float,direction:Int):Void
	{
		
		var xIndex:Int =Std.int( x / 32);
		var yIndex:Int =Std.int( y / 32);
		
		var type:Int = mMap.getTile(xIndex, yIndex);
		if (type != 333)
		{
			if (direction& FlxObject.DOWN>0)
			{
				switch(type)
				{
					
					case SIDESTILE:
						type = ALLTILE;
					case LEFTTILE:
						type = TOPLEFTTILE;
					case RIGHTTILE:
						type = TOPRIGHTTILE;
					case EMPTY:
						type = TOPTILE;
				}
				
			}else
			if (direction& FlxObject.RIGHT>0)
			{
				switch(type)
				{
					case TOPRIGHTTILE:
						type = ALLTILE;

					case RIGHTTILE:
						type = SIDESTILE;
					
					case TOPTILE:
						type = TOPLEFTTILE;

					case EMPTY:
						type = LEFTTILE;
				}
				
			}else
			if (direction& FlxObject.LEFT>0)
			{
				switch(type)
				{
					case TOPLEFTTILE:
						type = ALLTILE;
						
					case LEFTTILE:
						type = SIDESTILE;
	
					case TOPTILE:
						type = TOPRIGHTTILE;
					
					case EMPTY:
						type = RIGHTTILE;
				}
				
			}
			mMap.setTile(xIndex, yIndex, type);
		}
	}
}
