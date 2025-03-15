// import 'dart:io';


// abstract class ImageUploadState  {
//   const ImageUploadState();

//   @override
//   List<Object?> get props => [];
// }

// class ImageInitial extends ImageUploadState {}

// class ImagePicked extends ImageUploadState {
//   final File imageFile;
//   const ImagePicked(this.imageFile);

//   @override
//   List<Object?> get props => [imageFile];
// }

// class ImageUploading extends ImageUploadState {}

// class ImageUploaded extends ImageUploadState {
//   final List<String> mediaUrls;
//   const ImageUploaded(this.mediaUrls);

//   @override
//   List<Object?> get props => [mediaUrls];
// }

// class ImageUploadError extends ImageUploadState {
//   final String message;
//   const ImageUploadError(this.message);

//   @override
//   List<Object?> get props => [message];
// }
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class MediaUploadState {
  const MediaUploadState();

  @override
  List<Object?> get props => [];
}

class MediaInitial extends MediaUploadState {}

class MediaPicked extends MediaUploadState {
  final File mediaFile;
  final bool isVideo;
  const MediaPicked(this.mediaFile, this.isVideo);

  @override
  List<Object?> get props => [mediaFile, isVideo];
}

class MediaUploading extends MediaUploadState {}

class MediaUploaded extends MediaUploadState {
  final List<String> mediaUrls;
  const MediaUploaded(this.mediaUrls);

  @override
  List<Object?> get props => [mediaUrls];
}

class MediaUploadError extends MediaUploadState {
  final String message;
  const MediaUploadError(this.message);

  @override
  List<Object?> get props => [message];
}