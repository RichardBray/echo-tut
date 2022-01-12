package levels;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.util.FlxColor;

import states.GameState;

using echo.FlxEcho;
using echo.math.Vector2;

class LevelTwo extends GameState {
	var player: FlxSprite;

	final colorBlue: FlxColor = 0xff23C3CD;
	final colorOrange: FlxColor = 0xffDB7246;
	final colorRed: FlxColor = 0xffD63131;
	final colorGreen: FlxColor = 0xff51CF8B;

	override function create() {
		super.create();
		bgColor = FlxColor.WHITE;

		FlxEcho.init({
			width: FlxG.width,
			height: FlxG.height,
			gravity_y: 981,
		});

		final assetPath = "assets/images/sloped_platform.png";
		final slopedPlatform = new FlxSprite(203, 847);
		slopedPlatform.loadGraphic(assetPath, 859, 233);
		slopedPlatform.add_body({
			mass: 0,
			shape: {
				type: POLYGON,
				vertices: slopeVerticies(slopedPlatform),
			}
		});
		add(slopedPlatform);

		final endPlatform = new FlxSprite(1356, 847);
		endPlatform.makeGraphic(564, 233, colorBlue);
		add(endPlatform);

		final pushableBox = new FlxSprite(915, 613);
		pushableBox.makeGraphic(147, 234, colorRed);
		add(pushableBox);

		final floatingBox = new FlxSprite(1209, 163);
		floatingBox.makeGraphic(147, 234, colorRed);
		add(floatingBox);

		final floatingBoxTrigger = new FlxSprite(758, 839);
		floatingBoxTrigger.makeGraphic(67, 8, colorRed);
		add(floatingBoxTrigger);

		final endGoal = new FlxSprite(1815, 717);
		endGoal.makeGraphic(90, 130, colorGreen);
		add(endGoal);

		final floorBoundary = new FlxObject(0, 1080, 243, 1);
		floorBoundary.add_body({mass: 0});
		add(floorBoundary);

		final leftBoundary = new FlxObject(0, 979, 1, 101);
		leftBoundary.add_body({mass: 0});
		add(leftBoundary);

		player = new FlxSprite(71, 986).makeGraphic(40, 94, colorOrange);
		player.add_body();
		add(player);

		player.listen(floorBoundary);
		player.listen(leftBoundary);
		player.listen(slopedPlatform);
	}

	function playerMovement() {
		final physicsBody = player.get_body();
		final SPEED = 200;

		physicsBody.velocity.x = 0;

		if (FlxG.keys.pressed.LEFT || FlxG.keys.pressed.RIGHT) {
			physicsBody.velocity.x = FlxG.keys.pressed.RIGHT ? SPEED : -SPEED;
		}
	}

	function slopeVerticies(slopedPlatform: FlxSprite): Array<Vector2> {
		final nestedArr: Array<Array<Float>> = [[203, 1080], [608.5, 847], [1062, 847], [1062, 1080],];

		return nestedArr.map(
			arr -> new Vector2(
				(arr[0] - 203) - (slopedPlatform.width / 2),
				(arr[1] - 1080) + (slopedPlatform.height / 2)
			)
		);
	}

	override function update(elapsed: Float) {
		super.update(elapsed);
		playerMovement();
	}
}