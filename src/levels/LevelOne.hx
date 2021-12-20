package levels;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

import states.GameState;

using echo.FlxEcho;

class LevelOne extends GameState {

  override function create() {
    super.create();
		bgColor = FlxColor.WHITE;
    // Equivalent to Echo start
		// https://austineast.dev/echo/api/echo/Echo.html#start
		// https://austineast.dev/echo/api/echo/data/WorldOptions.html
		FlxEcho.init({
			width: FlxG.width,
			height: FlxG.height,
			gravity_y: 981,
		});

		final redCircle = new FlxSprite(181, 31);
    redCircle.loadGraphic("assets/images/red_circle_spots.png", 84, 84);
		// redCircle.add_body(); // default params https://github.com/AustinEast/echo-flixel/blob/master/echo/FlxEcho.hx#L111
		redCircle.add_body({
			mass: 1,
			elasticity: 1,
			shape: {
				type: CIRCLE,
				radius: 42,
			}
		});
		add(redCircle);

		final blueRect = new FlxSprite(138, 169);
    blueRect.loadGraphic("assets/images/blue_rect.png", 574, 35);
		// blueRect.add_body({mass: 0, rotation: 15});
		add(blueRect);

		final blueRectTwo = new FlxSprite(679, 510);
    blueRectTwo.loadGraphic("assets/images/blue_rect.png", 574, 35);
		blueRectTwo.add_body({mass: 0, rotation: 165});
		add(blueRectTwo);

		redCircle.listen(blueRect);
		redCircle.listen(blueRectTwo);
		// FlxEcho.instance.world.listen();
  }
}