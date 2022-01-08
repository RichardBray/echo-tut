package;

import flixel.FlxGame;

import levels.LevelTwo;

import openfl.display.Sprite;

import states.GameState;

class Main extends Sprite {
	public function new() {
		super();
		addChild(new FlxGame(1920, 1080, LevelTwo, true));
	}
}