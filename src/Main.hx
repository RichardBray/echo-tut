package;

import flixel.FlxGame;

import levels.LevelOne;

import openfl.display.Sprite;

import states.GameState;

class Main extends Sprite {
	public function new() {
		super();
		addChild(new FlxGame(1280, 720, LevelOne, true));
	}
}