import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/domain/models/player.dart';

class SelectRoundhouseListPlayer extends ConsumerStatefulWidget {
  final Player player;

  const SelectRoundhouseListPlayer({
    required this.player,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SelectRoundhouseListPlayerState();
}

class _SelectRoundhouseListPlayerState
    extends ConsumerState<SelectRoundhouseListPlayer> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
