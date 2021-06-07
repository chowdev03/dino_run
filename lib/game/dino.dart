import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/spritesheet.dart';

const double groundHeigth = 32;
const double dinoGroundTopBottomSpacing = 10;
const int numberOfTilesAlongWidth = 10;

class Dino extends AnimationComponent {
  Animation _runAnimation;
  Animation _hitAnimation;

  double speedY = 0.0;
  double maxY = 0.0;

  // ignore: non_constant_identifier_names
  double GRAVITY = 1000;
  Dino() : super.empty() {
// 0 - 3 = idle
// 4 - 10 = run
// 11 - 13 = kick
// 14 - 16 = hit
// 17 - 23 = Sprint

    final spritesheet = SpriteSheet(
        imageName: 'DinoSprites - doux.png',
        textureWidth: 24,
        textureHeight: 24,
        columns: 24,
        rows: 1);

    _runAnimation =
        spritesheet.createAnimation(0, from: 4, to: 10, stepTime: 0.1);

    _hitAnimation =
        spritesheet.createAnimation(0, from: 14, to: 16, stepTime: 0.1);

    this.animation = _runAnimation;
  }
  @override
  void resize(Size size) {
    super.resize(size);

    this.height = this.width = size.width / numberOfTilesAlongWidth;
    this.x = this.width;

    this.y =
        size.height - groundHeigth - this.height + dinoGroundTopBottomSpacing;
    this.maxY = this.y;
  }

  @override
  void update(double t) {
    super.update(t);
    this.speedY += GRAVITY * t;

    this.y += speedY * t;

    if (isGround()) {
      this.y = this.maxY;
      this.speedY = 0.0;
    }
  }

  bool isGround() {
    return (this.y >= this.maxY);
  }

  void run() {
    this.animation = _runAnimation;
  }

  void hit() {
    this.animation = _hitAnimation;
  }

  void jump() {
    if (isGround()) {
      this.speedY = -600;
    }
  }
}
