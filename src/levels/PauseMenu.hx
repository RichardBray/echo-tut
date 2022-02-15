package levels;


import echo.FlxEcho;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.system.FlxAssets;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PauseMenu extends FlxSubState {
	var bgOverlay: FlxSprite;
	var title: FlxText;

	override public function create() {
		super.create();
		bgColor = 0x75ffffff;
    // FlxEcho.updates = false;

		final title = new FlxText(0, 100, 0, "Game paused");
    title.setFormat(FlxAssets.FONT_DEFAULT, 100, FlxColor.BLACK);
		title.screenCenter(X);
		title.scrollFactor.set(0, 0);
		add(title);
	}

	override public function update(elapsed: Float) {
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE) {
			FlxG.sound.resume();
      // FlxEcho.updates = true;
			close();
		}
	}
}