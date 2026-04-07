part of '../view.dart';

class _Header extends StatefulWidget {
  const _Header({super.key});

  @override
  State<_Header> createState() => _HeaderState();
}

class _HeaderState extends State<_Header> {
  /// pick image
  String? selectedImage;
  Future<void> pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {
        selectedImage = pickedImage.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        AppImage(
          image: 'assets/images/top_head_profile.png',
          width: double.infinity,
          fit: BoxFit.cover,
        ),

        Positioned(
          bottom: -48.h,
          child: GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(60.r),
              child: Container(
                width: 96.w,
                height: 96.h,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: AppImage(
                  image:
                      PrefHelper.image ??
                      "https://img.freepik.com/free-photo/handsome-bearded-guy-posing-against-white-wall_273609-20597.jpg?semt=ais_incoming&w=740&q=80",
                  fit: BoxFit.cover,
                ),
                // child: selectedImage != null
                //     ? Image.file(
                //         File(selectedImage.toString()),
                //         fit: BoxFit.cover,
                //         width: 140,
                //         height: 140,
                //       )
                // : (PrefHelper.image != null && PrefHelper.image!.isNotEmpty)
                // ? Image.network(
                //     PrefHelper.image!,
                //     fit: BoxFit.cover,
                //     width: 140,
                //     height: 140,
                //   )
                // : Image.asset(
                //     'assets/images/profile_avater.png',
                //     fit: BoxFit.cover,
                //     width: 140,
                //     height: 140,
                //   ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
