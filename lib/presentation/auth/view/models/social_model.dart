import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SocialModel extends Equatable {
  final String title;
  final String img;
  final Color bg;
  final Color textColor;

  SocialModel({
    required this.title,
    required this.img,
    required this.bg,
    required this.textColor,
  });

  @override
  List<Object?> get props => [title, img, bg, textColor];
}
