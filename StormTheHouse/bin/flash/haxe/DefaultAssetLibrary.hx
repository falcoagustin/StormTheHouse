package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if flash
		
		className.set ("flixel/sounds/beep.mp3", __ASSET__flixel_sounds_beep_mp3);
		type.set ("flixel/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("flixel/sounds/flixel.mp3", __ASSET__flixel_sounds_flixel_mp3);
		type.set ("flixel/sounds/flixel.mp3", AssetType.MUSIC);
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		className.set ("img/manOld_gun.png", __ASSET__img_manold_gun_png);
		type.set ("img/manOld_gun.png", AssetType.IMAGE);
		className.set ("img/manOld_silencer.png", __ASSET__img_manold_silencer_png);
		type.set ("img/manOld_silencer.png", AssetType.IMAGE);
		className.set ("img/spritesheet_characters.png", __ASSET__img_spritesheet_characters_png);
		type.set ("img/spritesheet_characters.png", AssetType.IMAGE);
		className.set ("img/survivor1_gun.png", __ASSET__img_survivor1_gun_png);
		type.set ("img/survivor1_gun.png", AssetType.IMAGE);
		className.set ("img/tilesheet_complete.png", __ASSET__img_tilesheet_complete_png);
		type.set ("img/tilesheet_complete.png", AssetType.IMAGE);
		className.set ("map/BasicMap.csv", __ASSET__map_basicmap_csv);
		type.set ("map/BasicMap.csv", AssetType.TEXT);
		className.set ("map/BasicMap_Background.csv", __ASSET__map_basicmap_background_csv);
		type.set ("map/BasicMap_Background.csv", AssetType.TEXT);
		className.set ("map/BasicMap_Walls.csv", __ASSET__map_basicmap_walls_csv);
		type.set ("map/BasicMap_Walls.csv", AssetType.TEXT);
		className.set ("map/BigMap_Background.csv", __ASSET__map_bigmap_background_csv);
		type.set ("map/BigMap_Background.csv", AssetType.TEXT);
		className.set ("map/BigMap_Floor.csv", __ASSET__map_bigmap_floor_csv);
		type.set ("map/BigMap_Floor.csv", AssetType.TEXT);
		className.set ("map/BigMap_Objects.csv", __ASSET__map_bigmap_objects_csv);
		type.set ("map/BigMap_Objects.csv", AssetType.TEXT);
		className.set ("map/BigMap_Small Objects.csv", __ASSET__map_bigmap_small_objects_csv);
		type.set ("map/BigMap_Small Objects.csv", AssetType.TEXT);
		className.set ("map/BigMap_Walls.csv", __ASSET__map_bigmap_walls_csv);
		type.set ("map/BigMap_Walls.csv", AssetType.TEXT);
		className.set ("sound/war_go_go_go.ogg", __ASSET__sound_war_go_go_go_ogg);
		type.set ("sound/war_go_go_go.ogg", AssetType.SOUND);
		className.set ("ui/buttonLong_blue.png", __ASSET__ui_buttonlong_blue_png);
		type.set ("ui/buttonLong_blue.png", AssetType.IMAGE);
		className.set ("ui/buttonLong_blue_pressed.png", __ASSET__ui_buttonlong_blue_pressed_png);
		type.set ("ui/buttonLong_blue_pressed.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "flixel/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "flixel/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "flixel/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__flixel_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/fonts/monsterrat.ttf";
		className.set (id, __ASSET__flixel_fonts_monsterrat_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/images/ui/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/manOld_gun.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/manOld_silencer.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/spritesheet_characters.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/survivor1_gun.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/tilesheet_complete.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "map/BasicMap.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "map/BasicMap_Background.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "map/BasicMap_Walls.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "map/BigMap_Background.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "map/BigMap_Floor.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "map/BigMap_Objects.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "map/BigMap_Small Objects.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "map/BigMap_Walls.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "sound/war_go_go_go.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "ui/buttonLong_blue.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "ui/buttonLong_blue_pressed.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("flixel/sounds/beep.mp3", __ASSET__flixel_sounds_beep_mp3);
		type.set ("flixel/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("flixel/sounds/flixel.mp3", __ASSET__flixel_sounds_flixel_mp3);
		type.set ("flixel/sounds/flixel.mp3", AssetType.MUSIC);
		
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		className.set ("img/manOld_gun.png", __ASSET__img_manold_gun_png);
		type.set ("img/manOld_gun.png", AssetType.IMAGE);
		
		className.set ("img/manOld_silencer.png", __ASSET__img_manold_silencer_png);
		type.set ("img/manOld_silencer.png", AssetType.IMAGE);
		
		className.set ("img/spritesheet_characters.png", __ASSET__img_spritesheet_characters_png);
		type.set ("img/spritesheet_characters.png", AssetType.IMAGE);
		
		className.set ("img/survivor1_gun.png", __ASSET__img_survivor1_gun_png);
		type.set ("img/survivor1_gun.png", AssetType.IMAGE);
		
		className.set ("img/tilesheet_complete.png", __ASSET__img_tilesheet_complete_png);
		type.set ("img/tilesheet_complete.png", AssetType.IMAGE);
		
		className.set ("map/BasicMap.csv", __ASSET__map_basicmap_csv);
		type.set ("map/BasicMap.csv", AssetType.TEXT);
		
		className.set ("map/BasicMap_Background.csv", __ASSET__map_basicmap_background_csv);
		type.set ("map/BasicMap_Background.csv", AssetType.TEXT);
		
		className.set ("map/BasicMap_Walls.csv", __ASSET__map_basicmap_walls_csv);
		type.set ("map/BasicMap_Walls.csv", AssetType.TEXT);
		
		className.set ("map/BigMap_Background.csv", __ASSET__map_bigmap_background_csv);
		type.set ("map/BigMap_Background.csv", AssetType.TEXT);
		
		className.set ("map/BigMap_Floor.csv", __ASSET__map_bigmap_floor_csv);
		type.set ("map/BigMap_Floor.csv", AssetType.TEXT);
		
		className.set ("map/BigMap_Objects.csv", __ASSET__map_bigmap_objects_csv);
		type.set ("map/BigMap_Objects.csv", AssetType.TEXT);
		
		className.set ("map/BigMap_Small Objects.csv", __ASSET__map_bigmap_small_objects_csv);
		type.set ("map/BigMap_Small Objects.csv", AssetType.TEXT);
		
		className.set ("map/BigMap_Walls.csv", __ASSET__map_bigmap_walls_csv);
		type.set ("map/BigMap_Walls.csv", AssetType.TEXT);
		
		className.set ("sound/war_go_go_go.ogg", __ASSET__sound_war_go_go_go_ogg);
		type.set ("sound/war_go_go_go.ogg", AssetType.SOUND);
		
		className.set ("ui/buttonLong_blue.png", __ASSET__ui_buttonlong_blue_png);
		type.set ("ui/buttonLong_blue.png", AssetType.IMAGE);
		
		className.set ("ui/buttonLong_blue_pressed.png", __ASSET__ui_buttonlong_blue_pressed_png);
		type.set ("ui/buttonLong_blue_pressed.png", AssetType.IMAGE);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofData (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_manold_gun_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_manold_silencer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_spritesheet_characters_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_survivor1_gun_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_tilesheet_complete_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__map_basicmap_csv extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__map_basicmap_background_csv extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__map_basicmap_walls_csv extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__map_bigmap_background_csv extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__map_bigmap_floor_csv extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__map_bigmap_objects_csv extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__map_bigmap_small_objects_csv extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__map_bigmap_walls_csv extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__sound_war_go_go_go_ogg extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__ui_buttonlong_blue_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__ui_buttonlong_blue_pressed_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5



@:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { super (); name = "Monsterrat"; } } 



















#else



#if (windows || mac || linux || cpp)


@:file("C:/HaxeToolkit/haxe/lib/flixel/4,0,1/assets/sounds/beep.mp3") #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,0,1/assets/sounds/flixel.mp3") #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends lime.utils.Bytes {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,0,1/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,0,1/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,0,1/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:image("assets/img/manOld_gun.png") #if display private #end class __ASSET__img_manold_gun_png extends lime.graphics.Image {}
@:image("assets/img/manOld_silencer.png") #if display private #end class __ASSET__img_manold_silencer_png extends lime.graphics.Image {}
@:image("assets/img/spritesheet_characters.png") #if display private #end class __ASSET__img_spritesheet_characters_png extends lime.graphics.Image {}
@:image("assets/img/survivor1_gun.png") #if display private #end class __ASSET__img_survivor1_gun_png extends lime.graphics.Image {}
@:image("assets/img/tilesheet_complete.png") #if display private #end class __ASSET__img_tilesheet_complete_png extends lime.graphics.Image {}
@:file("assets/maps/BasicMap.csv") #if display private #end class __ASSET__map_basicmap_csv extends lime.utils.Bytes {}
@:file("assets/maps/BasicMap_Background.csv") #if display private #end class __ASSET__map_basicmap_background_csv extends lime.utils.Bytes {}
@:file("assets/maps/BasicMap_Walls.csv") #if display private #end class __ASSET__map_basicmap_walls_csv extends lime.utils.Bytes {}
@:file("assets/maps/BigMap_Background.csv") #if display private #end class __ASSET__map_bigmap_background_csv extends lime.utils.Bytes {}
@:file("assets/maps/BigMap_Floor.csv") #if display private #end class __ASSET__map_bigmap_floor_csv extends lime.utils.Bytes {}
@:file("assets/maps/BigMap_Objects.csv") #if display private #end class __ASSET__map_bigmap_objects_csv extends lime.utils.Bytes {}
@:file("assets/maps/BigMap_Small Objects.csv") #if display private #end class __ASSET__map_bigmap_small_objects_csv extends lime.utils.Bytes {}
@:file("assets/maps/BigMap_Walls.csv") #if display private #end class __ASSET__map_bigmap_walls_csv extends lime.utils.Bytes {}
@:file("assets/sound/war_go_go_go.ogg") #if display private #end class __ASSET__sound_war_go_go_go_ogg extends lime.utils.Bytes {}
@:image("assets/ui/buttonLong_blue.png") #if display private #end class __ASSET__ui_buttonlong_blue_png extends lime.graphics.Image {}
@:image("assets/ui/buttonLong_blue_pressed.png") #if display private #end class __ASSET__ui_buttonlong_blue_pressed_png extends lime.graphics.Image {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_monsterrat_ttf (); src = font.src; name = font.name; super (); }}

#end

#end