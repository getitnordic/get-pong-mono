import 'package:flutter/material.dart';

import '../../../utils/mixins/set_profile_image_mixin.dart';

// class MyProfileImage extends StatefulWidget {
//   final String playerId;
//   final double size;
//   const MyProfileImage({
//     Key? key,
//     required this.playerId,
//     required this.size,
//   }) : super(key: key);

//   @override
//   State<MyProfileImage> createState() => _MyProfileImageState();
// }

// class _MyProfileImageState extends State<MyProfileImage>
//     with SetProfileImageMixin {
//   String imageUrl = '';
//   double size = 0;
//   late Future<Widget> futureWidget;

//   Future<Widget> fetchImage() async {
//     if (imageUrl.startsWith('https://') &&
//         Uri.tryParse(imageUrl) != null &&
//         Uri.tryParse(imageUrl)!.hasAbsolutePath) {
//       final response = await http.get(Uri.parse(imageUrl));
//       if (response.statusCode == 200 &&
//           (response.headers.keys.contains('content-type') &&
//               !response.headers['content-type']!.contains('text/html'))) {
//         // If the server did return a 200 OK response,
//         // then parse the data.
//         return ClipRRect(
//           borderRadius: BorderRadius.circular(80),
//           child: Container(
//             height: widget.size,
//             width: widget.size,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: MemoryImage(response.bodyBytes),
//               ),
//             ),
//           ),
//         );
//       } else {
//         // If the server did not return a 200 OK response,
//         // then
//         return ClipRRect(
//           borderRadius: BorderRadius.circular(80),
//           child: Container(
//             height: widget.size,
//             width: widget.size,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/default_avatar_getit.png'),
//               ),
//             ),
//           ),
//         );
//       }
//     }
//     return const Text('Failed to load Image');
//   }

//   @override
//   void initState() {
//     setState(() {
//       imageUrl = getImageUrl(widget.playerId);
//       futureWidget = fetchImage();
//       size = widget.size;
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Widget>(
//       future: futureWidget,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return snapshot.data!;
//         } else if (snapshot.hasError) {
//           return Text('${snapshot.error}');
//         }
//         // By default, show a loading spinner.
//         return SizedBox(
//           height: size,
//           width: size,
//           child: const CircularProgressIndicator(),
//         );
//       },
//     );
//   }
// }

// class MyProfileImage extends StatelessWidget with SetProfileImageMixin {
//   final String playerId;
//   final double size;
//   const MyProfileImage({
//     Key? key,
//     required this.playerId,
//     required this.size,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//       imageUrl: getImageUrl(playerId),
//       imageBuilder: (context, imageProvider) => ClipRRect(
//         borderRadius: BorderRadius.circular(80),
//         child: Container(
//           height: size,
//           width: size,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: imageProvider,
//             ),
//           ),
//         ),
//       ),
//       placeholder: (context, url) => ClipRRect(
//         borderRadius: BorderRadius.circular(80),
//         child: Container(
//           height: size,
//           width: size,
//           decoration: const BoxDecoration(
//             color: ColorConstants.appBarColor,
//           ),
//         ),
//       ),
//       errorWidget: (context, url, error) => ClipRRect(
//         borderRadius: BorderRadius.circular(80),
//         child: Container(
//           height: size,
//           width: size,
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/images/default_avatar_getit.png'),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class MyProfileImage extends StatefulWidget {
  final String playerId;
  final double size;
  const MyProfileImage({
    Key? key,
    required this.playerId,
    required this.size,
  }) : super(key: key);

  @override
  State<MyProfileImage> createState() => _MyProfileImageState();
}

class _MyProfileImageState extends State<MyProfileImage>
    with SetProfileImageMixin {
  late dynamic image;

  @override
  void initState() {
    setState(() {
      image = NetworkImage(getImageUrl(widget.playerId));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(80),
      child: Container(
        height: widget.size,
        width: widget.size,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: image,
            onError: (exception, stackTrace) {
              setState(
                () {
                  image = const AssetImage(
                      'assets/images/default_avatar_getit.png');
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
