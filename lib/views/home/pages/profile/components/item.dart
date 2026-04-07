part of '../view.dart';

class _Item extends StatelessWidget {
  final Function()? onTap;
  final String iconPath;
  final String text;
  const _Item({
    super.key,
    this.onTap,
    required this.iconPath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            AppImage(
              image: iconPath,
              width: 17.w,
              height: 17.h,
              color: AppColors.primaryColor,
            ),
            10.pw,
            Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_right, size: 24.sp, color: AppColors.primaryColor),
          ],
        ),
      ),
    );
  }
}
