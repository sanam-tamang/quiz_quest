import 'package:flutter/material.dart';

class BannerArtWidget extends StatelessWidget {
  const BannerArtWidget({
    super.key,
    required this.child,
    required this.text, this.top, this.right,
 
  });
  final String text;

  final Widget child;
  final double? top;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      child: Stack(
        children: [
          child,
          Positioned(
            top:top??55,
            right: right ?? 12,
           
            child: Container(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.002)
                ..rotateZ(-0.4),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.blue, Colors.blueGrey]),
                  borderRadius: BorderRadius.circular(15)),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      text,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white70),
                    ),
                  ),
                  Positioned(
                      top: 1,
                      right: 1,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade200,
                        radius: 6,
                      )),
                  const Positioned(
                      bottom: 3,
                      left: 3,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 3,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
