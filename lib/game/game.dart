import 'package:flame/components/parallax_component.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';

import 'dino.dart';

//import 'package:flutter/physics.dart';

class DinoGame extends BaseGame with TapDetector {
  Dino _dino;
  ParallaxComponent _parallaxComponent;

  DinoGame() {
    _parallaxComponent = ParallaxComponent([
      ParallaxImage('parallax/plx-1.png'),
      ParallaxImage('parallax/plx-2.png'),
      ParallaxImage('parallax/plx-3.png'),
      ParallaxImage('parallax/plx-4.png'),
      ParallaxImage('parallax/plx-5.png'),
      ParallaxImage('parallax/plx-6.png', fill: LayerFill.none),
    ], baseSpeed: Offset(100, 0), layerDelta: Offset(20, 0));
    add(_parallaxComponent);

    _dino = Dino();
    add(_dino);
  }
  @override
  void onTapDown(TapDownDetails details) {
    super.onTapDown(details);
    _dino.jump();
  }
}
