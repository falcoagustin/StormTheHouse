package states;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import gameObjects.Bullet;
import gameObjects.Enemy;
import gameObjects.Gun;
import gameObjects.Mirko;
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
	var time:Float;
	var gameOver:FlxText;
	var restartButton:FlxButton;

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
		mMapWalls.loadMapFromCSV(Assets.getText("map/BasicMap_Walls.csv"), Assets.getBitmapData("img/tilesheet_complete.png"), 64, 64,null,0,0);
		add(mMapWalls);
		
		bullets = new FlxGroup();
		add(bullets);
		enemyBullets = new FlxGroup();
		add(enemyBullets);
		
		gun = new Gun(bullets);

		mirko = new Mirko(100, 100, gun);
		add(mirko);
		
		GlobalGameData.instance.setPlayer(mirko);
		
		enemies = new FlxGroup();/*
		for (i in 0...10){
			var aGun = new Gun(enemyBullets);
			var enemy:Enemy = new Enemy(100 * i, 200, aGun, mMapWalls);
			enemies.add(enemy);
		}
		*/
		add(enemies);
		
		score = 0;
		scoreLabel = new FlxText(FlxG.camera.x + 20, FlxG.camera.y + 20, 130, "Score: 0", 12);
		add(scoreLabel);
		
		time = 0;
		
		FlxG.camera.follow(mirko, FlxCameraFollowStyle.TOPDOWN);
		FlxG.camera.setScrollBoundsRect(0, 0, mMapBack.width, mMapBack.height);
		FlxG.worldBounds.set(0, 0, mMapBack.width, mMapBack.height);
		
	}
	override public function update(aDelta:Float):Void 
	{
		super.update(aDelta);
		time += aDelta;
		if (time >= 1){
			var aGun = new Gun(enemyBullets);
			var enemy:Enemy = new Enemy(500, 500, aGun, mMapWalls);
			enemies.add(enemy);
			add(enemy);
			time = 0;
		}
		trace("hola");

		FlxG.collide(mirko, mMapWalls);
		FlxG.collide(enemies, mMapWalls);
		
		FlxG.collide(mMapWalls, bullets, wallsVsBullets);
		FlxG.collide(mMapWalls, enemyBullets, wallsVsBullets);
		FlxG.overlap(bullets, enemies, bulletVsEnemies);
		FlxG.overlap(enemyBullets, mirko, bulletVsMirko);
		score = GlobalGameData.instance.getScore();
		scoreLabel.x = mirko.x;
		scoreLabel.y = mirko.y - 30;
		scoreLabel.text = "Score: " + cast score;
	}
	
	private function wallsVsBullets(walls:FlxTilemap,aBullet:Bullet):Void
	{
		aBullet.kill();
		
	}
	
	private function bulletVsEnemies(aBullet:Bullet,aEnemy:Enemy):Void
	{
		aBullet.kill();
		aEnemy.damage();
		
	}
	
	private function bulletVsMirko(aBullet:Bullet,aMirko:Mirko):Void
	{
		gameOver = new FlxText(mirko.x, mirko.y, 500, "GameOver", 20);
		add(gameOver);
		restartButton = new FlxButton(mirko.x, mirko.y + 30, "Restart", restartGame);
		add(restartButton);
		aBullet.kill();
		aMirko.kill();
		
	}
	
	private function restartGame():Void{
		enemies.clear();
		bullets.clear();
		enemyBullets.clear();
		mirko.revive();
		mirko.x = 100;
		mirko.y = 100;
		score = 0;
		gameOver.kill();
		restartButton.kill();
		
	}
	
}