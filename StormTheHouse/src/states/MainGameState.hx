package states;

import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import gameObjects.Bullet;
import gameObjects.EnemiesLocationCreator;
import gameObjects.MeleeHitbox;
import gameObjects.Mirko;
import gameObjects.Vodka;
import gameObjects.enemies.Enemy;
import gameObjects.enemies.PistolEnemy;
import gameObjects.enemies.Zombie;
import gameObjects.freeWeapons.FreeGun;
import gameObjects.freeWeapons.FreeShotgun;
import gameObjects.freeWeapons.FreeWeapon;
import gameObjects.weapons.Gun;
import gameObjects.weapons.Shotgun;
import gameObjects.weapons.Weapon;
import gameObjects.weapons.ZombieGrab;
import openfl.Assets;

/**
 * ...
 * @author MateoCarranza
 */
class MainGameState extends FlxState
{
	
	var mMapBack:FlxTilemap;
	var mMapWalls:FlxTilemap;
	var mMapFloor:FlxTilemap;
	var mMapObj:FlxTilemap;
	var mMapSmallObj:FlxTilemap;
	var mirko:Mirko;
	var weapon:Weapon;
	var bullets:FlxGroup;
	var enemyBullets:FlxGroup;
	var enemies:FlxGroup;
	var freeWeapons:FlxGroup;
	var enemiesHitboxes:FlxGroup;
	var score:Int;
	var scoreLabel:FlxText;
	var hpLabel:FlxText;
	var zombiesAreComing:FlxText;
	var time:Float;
	var gameOver:FlxText;
	var restartButton:FlxButton;
	var killesToVodka:Int;
	var vodkas:FlxGroup;
	var enemyEntryPoints:Array<FlxPoint>;
	var enemiesLocationCreator:EnemiesLocationCreator;

	public function new() 
	{
		super();
		
		
	}
	
	override public function create():Void 
	{
		addMap();
		iniciateGroups();
		addMirko();
		setUI();
		
		FlxG.camera.follow(mirko, FlxCameraFollowStyle.TOPDOWN_TIGHT);
		FlxG.camera.setScrollBoundsRect(0, 0, mMapBack.width, mMapBack.height);
		FlxG.worldBounds.set(0, 0, mMapBack.width, mMapBack.height);
		
		time = 0;
		killesToVodka = 5;
		
		enemiesLocationCreator = new EnemiesLocationCreator();
		createInitialEnemies();
		createInitialWeapons();
		createInitialVodka();
		
	}
	
	
	private function addMap()
	{
		mMapBack = new FlxTilemap();
		mMapBack.loadMapFromCSV(Assets.getText("map/BigMap_Background.csv"), Assets.getBitmapData("img/tilesheet_complete.png"), 64, 64,null,0,-1);
		add(mMapBack);
		
		mMapFloor = new FlxTilemap();
		mMapFloor.loadMapFromCSV(Assets.getText("map/BigMap_Floor.csv"), Assets.getBitmapData("img/tilesheet_complete.png"), 64, 64,null,0,1);
		add(mMapFloor);
		
		mMapWalls = new FlxTilemap();
		mMapWalls.loadMapFromCSV(Assets.getText("map/BigMap_Walls.csv"), Assets.getBitmapData("img/tilesheet_complete.png"), 64, 64,null,0,1);
		add(mMapWalls);
		
		mMapObj = new FlxTilemap();
		mMapObj.loadMapFromCSV(Assets.getText("map/BigMap_Objects.csv"), Assets.getBitmapData("img/tilesheet_complete_rotate.png"), 64, 64,null,0,1);
		add(mMapObj);
		
		mMapSmallObj = new FlxTilemap();
		mMapSmallObj.loadMapFromCSV(Assets.getText("map/BigMap_Small_Objects.csv"), Assets.getBitmapData("img/tilesheet_complete.png"), 64, 64,null,0,1);
		add(mMapSmallObj);

	}
	
	private function addMirko()
	{
		bullets = new FlxGroup();
		add(bullets);
		var weapon: Weapon = new Gun(bullets);
		
		mirko = new Mirko(100, 100, weapon);
		add(mirko);
		
		GlobalGameData.instance.setPlayer(mirko);
	}
	
	private function iniciateGroups()
	{
		vodkas = new FlxGroup();
		add(vodkas);
		bullets = new FlxGroup();
		add(bullets);
		enemyBullets = new FlxGroup();
		add(enemyBullets);
		enemiesHitboxes = new FlxGroup();
		add(enemiesHitboxes);
		enemies = new FlxGroup();
		add(enemies);
		freeWeapons = new FlxGroup();
		add(freeWeapons);
	}
	
	private function setUI()
	{
		score = 0;
		scoreLabel = new FlxText(FlxG.camera.x + 20, FlxG.camera.y + 20, 130, "Score: 0", 12);
		hpLabel = new FlxText(FlxG.camera.x + 35, FlxG.camera.y + 35, 130, "HP: 5", 12);
		zombiesAreComing = new FlxText(mirko.x, mirko.y,500, "", 20);
		
		add(scoreLabel);
		add(hpLabel);
		add(zombiesAreComing);
		
	}
	
	private function createInitialEnemies()
	{
		var enemiesPath:Array<Array<FlxPoint>> = enemiesLocationCreator.initialEnemies();
		var i = 0;
		for (path in enemiesPath)
		{
			var gun:Weapon;
			var enemy:Enemy;
			if(i<5 || i == 11 || i == 14 || i == 16 || i == 17 || i >= 18 && i < 24 ){
				gun = new Gun(enemyBullets);
				enemy = new PistolEnemy(path[0].x, path[0].y, gun, mMapWalls, path);
				enemies.add(enemy);
			}
			if (i >= 5 && i < 11 || i == 12 || i==13 || i == 15 || i >= 24)
			{
				gun = new Shotgun(enemyBullets);
				enemy = new PistolEnemy(path[0].x, path[0].y, gun, mMapWalls, path);
				enemies.add(enemy);
			}
			
			i++;
		}
	}
	
	private function createInitialWeapons()
	{
		var freeShotgun:FreeWeapon = new FreeShotgun(tile(19), tile(18));
		freeWeapons.add(freeShotgun);
		var freeShotgun2:FreeWeapon = new FreeShotgun(tile(54), tile(12));
		freeWeapons.add(freeShotgun2);
		var freeShotgun3:FreeWeapon = new FreeShotgun(tile(95), tile(4));
		freeWeapons.add(freeShotgun3);
		var freeGun:FreeWeapon = new FreeGun(tile(86), tile(11));
		freeWeapons.add(freeGun);
	}
	
	private function createInitialVodka()
	{
		var vodka = new Vodka(tile(16) + 25, tile(18));
		vodkas.add(vodka);
		var vodka2 = new Vodka(tile(55) + 25, tile(16));
		vodkas.add(vodka2);
		var vodka3 = new Vodka(tile(86) + 25, tile(11));
		vodkas.add(vodka3);
		var vodka4 = new Vodka(tile(51) + 25, tile(48));
		vodkas.add(vodka4);
		var vodka5 = new Vodka(tile(18) + 25, tile(53));
		vodkas.add(vodka5);
		var vodka6 = new Vodka(tile(76) + 25, tile(40));
		vodkas.add(vodka6);
		var vodka7 = new Vodka(tile(52) + 25, tile(4));
		vodkas.add(vodka7);
	}
	
	private function tile(number:Int):Int
	{
		return number * 64;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		time += elapsed;
		setScore();
		FlxG.collide(mirko, mMapWalls);
		FlxG.collide(enemies, mMapWalls);
		FlxG.collide(mirko, mMapObj);
		FlxG.collide(mirko, mMapSmallObj);
		FlxG.collide(enemies, mMapObj);

		FlxG.collide(mMapWalls, bullets, wallsVsBullets);
		FlxG.collide(mMapWalls, enemyBullets, wallsVsBullets);
		FlxG.collide(mMapSmallObj, bullets, wallsVsBullets);
		FlxG.collide(mMapSmallObj, enemyBullets, wallsVsBullets); 
		
		
		FlxG.overlap(bullets, enemies, bulletVsEnemies);
		FlxG.overlap(enemyBullets, mirko, bulletVsMirko);
		FlxG.overlap(mirko, vodkas, mirkoVsVodka);
		FlxG.overlap(mirko, freeWeapons, mirkoVsFreeWeapon);
		FlxG.overlap(enemiesHitboxes, mirko, meleeVsMirko);
		
		checkForZombies();
	}
	
	private function setScore()
	{
		score = GlobalGameData.instance.getScore();
		scoreLabel.x = mirko.x;
		scoreLabel.y = mirko.y - 30;
		scoreLabel.text = "Score: " + cast score;
		hpLabel.x = mirko.x;
		hpLabel.y = mirko.y - 50;
		hpLabel.text = "HP: " + cast mirko.get_HP();
		zombiesAreComing.x = mirko.x;
		zombiesAreComing.y = mirko.y - 70;
	}
	
	private function checkForZombies()
	{
		if (time > 3)
		{
			zombiesAreComing.text = "";
		}
		if (time > 30)
		{
			zombiesAreComing.text = "ZOMBIES ARE COMING!";
			time = 0;
			var zombiesLoc = enemiesLocationCreator.callTheZombies();
			for (loc in zombiesLoc)
			{
				var grab:Weapon = new ZombieGrab(enemiesHitboxes);
				var array = new Array<FlxPoint>();
				array.push(loc);
				var zombie:Enemy = new Zombie(loc.x, loc.y, grab, mMapWalls, array);
				enemies.add(zombie);
			}
			
		}
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
	}
	
	private function bulletVsMirko(aBullet:Bullet, aMirko:Mirko):Void
	{
		aBullet.kill();
		damageMirko(aMirko, 1);
	}
	
	private function meleeVsMirko(hitbox:MeleeHitbox, aMirko:Mirko):Void
	{
		hitbox.kill();
		damageMirko(aMirko, 5);
	}
	
	public function damageMirko(aMirko:Mirko, damage:Int)
	{
		
		if (aMirko.get_HP() > damage)
		{
			aMirko.removeHP(damage);
			
		}else
		{
			hpLabel.text = "HP: " + cast 0;
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
	
	private function mirkoVsFreeWeapon(aMirko:Mirko, freeWeapon:FreeWeapon):Void
	{
		var type = freeWeapon.getWeapon();
		freeWeapon.kill();
		switch type {
			case "gun":
				var newWeapon:Weapon = new Gun(bullets);
				mirko.setWeapon(newWeapon);
			case "shotgun":
				var newWeapon:Weapon = new Shotgun(bullets);
				mirko.setWeapon(newWeapon);
			default: 
				var newWeapon:Weapon = new Gun(bullets);
				mirko.setWeapon(newWeapon);
		}
	}
	
	private function restartGame():Void		
	{
		GlobalGameData.instance.setScore(0);
		FlxG.resetState();

	}
	
}