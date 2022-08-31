import 'package:flutter/material.dart';
import 'package:get_pong/utils/mixins/set_profile_image_mixin.dart';
import 'package:http/http.dart' as http;

class MyProfileImage extends StatefulWidget {
  final String playerId;
  final double size;
  MyProfileImage({
    Key? key,
    required this.playerId,
    required this.size,
  }) : super(key: key);

  @override
  State<MyProfileImage> createState() => _MyProfileImageState();
}

class _MyProfileImageState extends State<MyProfileImage>
    with SetProfileImageMixin {
  String imageUrl = '';
  double size = 0;
  late Future<Widget> futureWidget;

  Future<Widget> fetchImage() async {
    if (imageUrl.startsWith('https://') &&
        Uri.tryParse(imageUrl) != null &&
        Uri.tryParse(imageUrl)!.hasAbsolutePath) {
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200 &&
          (response.headers.keys.contains('content-type') &&
              !response.headers['content-type']!.contains('text/html'))) {
        // If the server did return a 200 OK response,
        // then parse the data.
        return ClipRRect(
          borderRadius: BorderRadius.circular(80),
          child: Container(
            height: widget.size,
            width: widget.size,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: MemoryImage(response.bodyBytes),
              ),
            ),
          ),
        );
      } else {
        // If the server did not return a 200 OK response,
        // then
        return ClipRRect(
          borderRadius: BorderRadius.circular(80),
          child: Container(
            height: widget.size,
            width: widget.size,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/default_avatar_getit.png'),
              ),
            ),
          ),
        );
      }
    }
    return const Text('Failed to load Image');
  }

  @override
  void initState() {
    setState(() {
      imageUrl = getImageUrl(widget.playerId);
      futureWidget = fetchImage();
      size = widget.size;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: futureWidget,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data!;
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        return SizedBox(
          height: size,
          width: size,
          child: const CircularProgressIndicator(),
        );
      },
    );
  }
}
