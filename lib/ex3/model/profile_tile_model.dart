import 'package:flutter/material.dart';

class ProfileData {
  final String name;
  final String position;
  final String avatarUrl;
  final List<TileData> tiles;

  ProfileData({
    required this.name,
    required this.position,
    required this.tiles,
    required this.avatarUrl,
  });
}

class TileData {
  final IconData icon;
  final String title;
  final String value;

  // String data;

  TileData({required this.icon, required this.title, required this.value});
}
