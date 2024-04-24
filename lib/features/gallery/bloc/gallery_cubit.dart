import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_gallery/core/cache/cahce_utils.dart';
import 'package:my_gallery/core/injection/di_container.dart';
import 'package:my_gallery/core/network/connection.dart';
import 'package:my_gallery/core/network/dio_helper.dart';
import 'package:my_gallery/core/network/end_points.dart';
import 'package:my_gallery/core/network/error_model.dart';
import 'package:my_gallery/core/utils/strings.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit() : super(GalleryInitial());

  static GalleryCubit get(BuildContext context) =>
      BlocProvider.of<GalleryCubit>(context);

  List<String> galleryImages = [];

  Future<void> getMyGallery() async {
    galleryImages = [];
    emit(GetGalleryLoad());
    /// there is a problem with new flutter version
    // if (await sl<InternetStatus>().checkConnectivity()) {
      try {
        final response = await DioHelper.getData(path: EndPoints.gallery);
        if (response.statusCode == 200) {
          response.data['data']['images'].forEach((imageUrl) {
            galleryImages.add(imageUrl);
          });
          emit(GetGallerySuccess());
        }
      } catch (error) {
        emit(GetGalleryError(AppStrings.errorMessage));
      }
    // } else {
    //   emit(GetGalleryError(AppStrings.checkInternet));
    // }
  }

  final ImagePicker picker = ImagePicker();
  File? image;

  Future<void> pickImage(ImageSource imageSource) async {
    try {
      XFile? pickedImage =
          await picker.pickImage(imageQuality: 100, source: imageSource);
      if (pickedImage != null) {
        image = File(pickedImage.path);
        emit(PickImageState());
        await uploadImage();
      }
    } catch (error) {
      emit(PickImageError(AppStrings.errorMessage));
    }
  }

  Future<void> uploadImage() async {
    emit(UploadImageLoading());
    /// there is a problem with new flutter version
    // if (await sl<InternetStatus>().checkConnectivity()) {
      try {
        final response = await DioHelper.postData(
            path: EndPoints.uploadImage,
            data: FormData.fromMap({
              'img': await MultipartFile.fromFile(image!.path,
                  filename: image!.path.split('/').last,
                  contentType: MediaType("image", "jpeg")),
            }));
        if (response.statusCode == 200) {
          image = null;
          emit(UploadImageSuccess());
        }
      } catch (error) {
        image = null;
        String errorMessage = sl<ErrorModel>().getErrorMessage(error);
        emit(UploadImageError(errorMessage));
      }
    // } else {
    //   emit(UploadImageError(AppStrings.checkInternet));
    // }
  }

  Future<void> logout() async {
    try {
      emit(LogoutLoading());
      await CacheUtils.deleteToken();
      await CacheUtils.deleteUserId();
      await CacheUtils.deleteUserName();
      emit(LogoutSuccess());
    } catch (error) {}
  }
}
