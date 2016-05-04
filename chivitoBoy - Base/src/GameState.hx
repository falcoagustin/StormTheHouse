package ;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.tile.FlxTilemap;
import openfl.Assets;

	
	/**
	 * ...
	 * @author joaquin
	 */
class GameState extends FlxState
{

	var mMap:FlxTilemap;
	var mChivitoBoy:ChivitoBoy;
	var mTray:Tray;

	public function new() 
	{
		super();
		
		
	}
	override public function create():Void 
	{
		mMap = new FlxTilemap();
		mMap.loadMapFromCSV(Assets.getText(AssetPaths.mapCSV_map2_tiles__csv), Assets.getBitmapData(AssetPaths.tiles__png), 32, 32);
		add(mMap);
		
		var mapTemp = new FlxTilemap();
		mapTemp.loadMapFromCSV(Assets.getText(AssetPaths.mapCSV_map2_tiles__csv), Assets.getBitmapData(AssetPaths.tiles__png), 32, 32);
		add(mapTemp);
		
		for (y in 0...mapTemp.heightInTiles){
			for (x in 0...mapTemp.widthInTiles){
				if (mapTemp.getTile(x, y) != 0){
					mapTemp.setTile(x, y, -1);
				}
			}
		}
		
		mTray = new Tray(mapTemp);
		
		
		mChivitoBoy = new ChivitoBoy(100,100);
		add(mChivitoBoy);
	
		FlxG.camera.follow(mChivitoBoy, FlxCameraFollowStyle.PLATFORMER);
		FlxG.camera.setScrollBoundsRect(0, 0, mMap.width, mMap.height);
		FlxG.worldBounds.set(0, 0, mMap.width, mMap.height);
	}
	override public function update(aDelta:Float):Void 
	{
		super.update(aDelta);
		FlxG.collide(mMap, mChivitoBoy);
		mTray.setContactPosition(mChivitoBoy.x - 1, mChivitoBoy.y + mChivitoBoy.height / 2, FlxObject.LEFT);
		mTray.setContactPosition(mChivitoBoy.x + mChivitoBoy.width, mChivitoBoy.y + mChivitoBoy.height / 2, FlxObject.RIGHT);
		mTray.setContactPosition(mChivitoBoy.x + mChivitoBoy.width/2, mChivitoBoy.y + mChivitoBoy.height, FlxObject.DOWN);
		

	}
	
	
	
}

