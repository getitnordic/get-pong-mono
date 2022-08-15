import 'package:flutter/material.dart';

import '../../Presentation/widgets/match_details/match_details.dart';

class MatchDetailsPage extends StatelessWidget {
  const MatchDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Details'),
      ),
      body: const MatchDetails(),
    );
  }
}
