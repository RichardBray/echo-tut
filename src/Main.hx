package;

import flixel.FlxGame;

import levels.LevelTwo;

import openfl.display.Sprite;

class Main extends Sprite {
	public function new() {
		super();
		addChild(new FlxGame(1920, 1080, LevelTwo, true));
	}
}