import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../protos/base.pb.dart';

class SelectRoundhouseListPlayer extends ConsumerStatefulWidget {
  final PlayerModel player;

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
