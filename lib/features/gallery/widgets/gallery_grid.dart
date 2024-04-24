import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_gallery/core/widgets/error_widget.dart';
import 'package:my_gallery/features/gallery/bloc/gallery_cubit.dart';
import 'package:my_gallery/features/gallery/widgets/gallery_image.dart';
import 'package:my_gallery/features/gallery/widgets/loading_grid.dart';

class GalleryGrid extends StatefulWidget {
  const GalleryGrid({super.key});

  @override
  State<GalleryGrid> createState() => _GalleryGridState();
}

class _GalleryGridState extends State<GalleryGrid> {
  GalleryCubit get cubit => GalleryCubit.get(context);

  @override
  void initState() {
    super.initState();
    _getGalleryImages();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async => _getGalleryImages(),
      child: BlocBuilder<GalleryCubit, GalleryState>(
        buildWhen: (previous, current) =>
            current is GetGalleryError ||
            current is GetGalleryLoad ||
            current is GetGallerySuccess,
        builder: (context, state) => state is GetGalleryLoad
            ? const LoadingGrid()
            : state is GetGalleryError
                ? CustomErrorWidget(message: state.error)
                : GridView.builder(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 15.w,
                      mainAxisSpacing: 15.w,
                      childAspectRatio: 1,
                    ),
                    itemCount: cubit.galleryImages.length,
                    itemBuilder: (context, index) =>
                        GalleryImage(imageUrl: cubit.galleryImages[index]),
                  ),
      ),
    );
  }

  /// /////////////////////////////
  /// ///////// Helper Methods //////
  /// ////////////////////////////////

  void _getGalleryImages() {
    cubit.getMyGallery();
  }
}
