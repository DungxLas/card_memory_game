import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import '../data/model/image_q.dart';

class Item1 extends StatelessWidget {
  const Item1({
    super.key,
    required this.image,
    required this.cardKey,
    required this.flipOnTouch,
    required this.onFlip,
    required this.onFlipB2FDone,
    required this.onFlipF2BDone,
  });
  final ImageQ image;
  final GlobalKey<FlipCardState> cardKey;
  final bool flipOnTouch;
  final VoidCallback onFlip;
  final VoidCallback onFlipB2FDone;
  final VoidCallback onFlipF2BDone;

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      key: cardKey,
      flipOnTouch: flipOnTouch,
      side: CardSide.BACK,
      onFlip: onFlip,
      speed: 100,
      onFlipDone: (isFront) {
        if (!isFront) {
          onFlipB2FDone();
        } else {
          onFlipF2BDone();
        }
      },
      front: Image.asset(
        image.front,
        height: 50,
        width: 50,
        fit: BoxFit.cover,
      ),
      back: Image.asset(
        'lib/assets/image/question_mark.png',
        height: 50,
        width: 50,
        fit: BoxFit.cover,
      ),
    );
  }
}
