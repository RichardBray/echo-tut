# Flixel Echo Tutorials

## Echo docs
https://austineast.dev/echo/
https://austineast.dev/echo/api/

## Zero
Difference betwen Flixel default physics, Echo, and Nape

AABB
https://api.haxeflixel.com/flixel/FlxG.html#collide
https://api.haxeflixel.com/flixel/FlxG.html#overlap
https://haxeflixel.com/documentation/cheat-sheet/

## One

1. Install echo:
```sh
lix install gh:AustinEast/echo-flixel
```

2. Add flixel to project.xml
```xml
<haxelib name="echo-flixel" />
```
https://github.com/AustinEast/echo-flixel

3. Start by adding one red circle and one blue rectangle, no rotation

4. Add using echo
5. Add echo init function
6. Add bodies to circle and rectangle
7. Add listener
8. Show echo debugger
9. Add rotation to blueRect

## Two

1. Add circle shape collisions
2. Add second rect
3. Add listener
4. add elactricity to red circle, start 0.5 them move to 1.0
5. If you want everything to collide with everyhting use this
```haxe
FlxEcho.instance.world.listen();
```

6. Don't put listernes in the update function always put them in create() or new()

---
echo on pause screen
overlaps
player movement