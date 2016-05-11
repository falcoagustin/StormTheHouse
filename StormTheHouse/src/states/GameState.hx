package states;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import gameObjects.Bullet;
import gameObjects.Enemy;
import gameObjects.Gun;
import gameObjects.Mirko;
import gameObjects.Vodka;
import openfl.Assets;

class GameState extends FlxState
{

	var mMapBack:FlxTilemap;
	var mMapWalls:FlxTilemap;
	var mirko:Mirko;
	var gun:Gun;
	var bullets:FlxGroup;
	var enemyBullets:FlxGroup;
	var enemies:FlxGroup;
	var score:Int;
	var scoreLabel:FlxText;
	var hpLabel:FlxText;
	var time:Float;
	var gameOver:FlxText;
	var restartButton:FlxButton;
	var killesToVodka:Int;
	var vodkas:FlxGroup;
	var enemyEntryPoints:Array<FlxPoint>;

	public function new() 
	{
		super();
		
		
	}
	override public function create():Void 
	{
		mMapBack = new FlxTilemap();
		mMapBack.loadMapFromCSV(Assets.getText("map/BasicMap_Background.csv"), Assets.getBitmapData("img/tilesheet_complete.png"), 64, 64,null,0,0);
		add(mMapBack);
		
		mMapWalls = new FlxTilemap();
		mMapWalls.loadMapFromCSV(Assets.getText("map/BasicMap_Walls.csv"), Assets.getBitmapData("img/tilesheet_complete.png"), 64, 64,null,0,1);
		add(mMapWalls);
		
		vodkas = new FlxGroup();
		add(vodkas);
		bullets = new FlxGroup();
		add(bullets);
		enemyBullets = new FlxGroup();
		add(enemyBullets);
		
		gun = new Gun(bullets);

		mirko = new Mirko(100, 100, gun);
		add(mirko);
		
		GlobalGameData.instance.setPlayer(mirko);
		
		enemies = new FlxGroup();
		add(enemies);
		
		score = 0;
		scoreLabel = new FlxText(FlxG.camera.x + 20, FlxG.camera.y + 20, 130, "Score: 0", 12);
		hpLabel = new FlxText(FlxG.camera.x + 35, FlxG.camera.y + 35, 130, "HP: 3", 12);
		
		add(scoreLabel);
		add(hpLabel);
		time = 0;
		
		FlxG.camera.follow(mirko, FlxCameraFollowStyle.TOPDOWN);
		FlxG.camera.setScrollBoundsRect(0, 0, mMapBack.width, mMapBack.height);
		FlxG.worldBounds.set(0, 0, mMapBack.width, mMapBack.height);
		
		
		var aGun = new Gun(enemyBullets);
		var enemy:Enemy = new Enemy(64 * 5 + 32, 64 * 6 + 32, aGun, mMapWalls);
		enemies.add(enemy);
		add(enemy);
		
		enemyEntryPoints = setEnemiesEntryPoints();
		
		killesToVodka = 5;
		
		//FlxG.sound.play(Assets.getText("sound/war_go_go_go.ogg"));
		
	}
	override public function update(aDelta:Float):Void 
	{
		super.update(aDelta);
		time += aDelta;
		if (time >= 2){
			
			var aGun = new Gun(enemyBullets);
			var point = enemyEntryPoints[FlxG.random.int(0, 3)];
			var enemy:Enemy = new Enemy(point.x, point.y, aGun, mMapWalls);
			enemies.add(enemy);
			add(enemy);
			time = 0;
		}
		
		

		FlxG.collide(mirko, mMapWalls);
		FlxG.collide(enemies, mMapWalls);
		
		FlxG.collide(mMapWalls, bullets, wallsVsBullets);
		FlxG.collide(mMapWalls, enemyBullets, wallsVsBullets);
		FlxG.overlap(bullets, enemies, bulletVsEnemies);
		FlxG.overlap(enemyBullets, mirko, bulletVsMirko);
		FlxG.overlap(mirko, vodkas, mirkoVsVodka);
		score = GlobalGameData.instance.getScore();
		scoreLabel.x = mirko.x;
		scoreLabel.y = mirko.y - 30;
		scoreLabel.text = "Score: " + cast score;
		hpLabel.x = mirko.x;
		hpLabel.y = mirko.y - 50;
		hpLabel.text = "HP: " + cast mirko.get_HP();
	}
	
	private function wallsVsBullets(walls:FlxTilemap,aBullet:Bullet):Void
	{
		aBullet.kill();
		//FlxG.sound.play(Assets.getText("sound/war_go_go_go.ogg"));
	}
	
	private function bulletVsEnemies(aBullet:Bullet,aEnemy:Enemy):Void
	{
		aBullet.kill();
		aEnemy.damage();
		
		killesToVodka -= 1;
		if (killesToVodka == 0){
			killesToVodka = 5;
			var xPoints = FlxG.random.int(0, 1280);
			var yPoints = FlxG.random.int(0, 720);
			if (mMapWalls.getTile(Std.int(xPoints / 64), Std.int(yPoints / 64)) != -1 )
			{
				xPoints += 64;
				yPoints += 64;
			}
			var vodka = new Vodka(xPoints, yPoints);
			vodkas.add(vodka);
		}
		
	}
	
	private function bulletVsMirko(aBullet:Bullet, aMirko:Mirko):Void
	{
		
		aBullet.kill();
		if (aMirko.get_HP() > 1)
		{
			aMirko.removeHP(1);
		}else
		{
			aMirko.kill();
			gameOver = new FlxText(mirko.x, mirko.y, 500, "GameOver", 20);
			add(gameOver);
			restartButton = new FlxButton(350 , 300, "Restart", restartGame);
			//restartButton.parallax.set(0);
			restartButton.scrollFactor.set(0,0);
			add(restartButton);
		}
	}
	
	private function mirkoVsVodka(aMirko:Mirko, aVodka:Vodka):Void
	{
		aVodka.kill();
		var health:Int = mirko.get_HP();
		health++;
		mirko.setHp(health);
		hpLabel.text = "HP: " + cast health;
		
	}
	
	private function restartGame():Void		
	{
		GlobalGameData.instance.setScore(0);
		FlxG.resetState();

	}
	
	private function setEnemiesEntryPoints():Array<FlxPoint>
	{
		var points = new Array<FlxPoint>();
		
		var point1 = new FlxPoint( -10, -10);
		var point2 = new FlxPoint( -10, mMapBack.height + 10);
		var point3 = new FlxPoint( mMapBack.width + 10, -10);
		var point4 = new FlxPoint(mMapBack.height + 10, mMapBack.width + 10);
		
		points.push(point1);
		points.push(point2);
		points.push(point3);
		points.push(point4);
		
		return points;
	}
	
}
