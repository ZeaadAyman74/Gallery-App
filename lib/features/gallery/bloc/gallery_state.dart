part of 'gallery_cubit.dart';

@immutable
abstract class GalleryState {}

class GalleryInitial extends GalleryState {}

class GetGalleryLoad extends GalleryState {}

class GetGallerySuccess extends GalleryState {}

class GetGalleryError extends GalleryState {
  final String error;
  GetGalleryError(this.error);
}

class PickImageState extends GalleryState {}

class PickImageError extends GalleryState {
  final String error;
  PickImageError(this.error);
}
class UploadImageLoading extends GalleryState {}

class UploadImageSuccess extends GalleryState {}

class UploadImageError extends GalleryState {
  final String error;
  UploadImageError(this.error);
}

class LogoutLoading extends GalleryState {}

class LogoutSuccess extends GalleryState {}
