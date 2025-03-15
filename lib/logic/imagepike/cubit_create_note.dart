// import 'dart:io';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:instgram_app/logic/imagepike/state_create_note.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';


// class ImageUploadCubit extends Cubit<ImageUploadState> {
//   ImageUploadCubit() : super(ImageInitial());

//   final ImagePicker picker = ImagePicker();
//   File? _imageFile;

//   Future<void> pickImage() async {
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       _imageFile = File(image.path);
//       emit(ImagePicked(_imageFile!));
//     }
//   }

//   Future<void> uploadImage() async {
//     if (_imageFile == null) return;

//     emit(ImageUploading());

//     try {
//       final fileName = DateTime.now().millisecondsSinceEpoch.toString();
//       final path = 'uploads/$fileName';

//       await Supabase.instance.client.storage.from('images').upload(path, _imageFile!);

//       final mediaUrls = await getAllImages();
//       emit(ImageUploaded(mediaUrls));
//     } catch (e) {
//       emit(ImageUploadError("Upload Failed: $e"));
//     }
//   }

//   Future<List<String>> getAllImages() async {
//     try {
//       final response = await Supabase.instance.client.storage.from('images').list(path: 'uploads');

//       return response.map((file) {
//         return Supabase.instance.client.storage.from('images').getPublicUrl('uploads/${file.name}');
//       }).toList();
//     } catch (e) {
//       emit(ImageUploadError("Error fetching images: $e"));
//       return [];
//     }
//   }
// }

import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instgram_app/logic/imagepike/state_create_note.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MediaUploadCubit extends Cubit<MediaUploadState> {
  MediaUploadCubit() : super(MediaInitial());

  final ImagePicker picker = ImagePicker();
  File? _mediaFile;
  bool _isVideo = false;

  Future<void> pickMedia(bool isVideo) async {
    try {
      final XFile? media = isVideo
          ? await picker.pickVideo(source: ImageSource.gallery, maxDuration: const Duration(seconds: 30))
          : await picker.pickImage(source: ImageSource.gallery, imageQuality: 85);
      
      if (media != null) {
        _mediaFile = File(media.path);
        _isVideo = isVideo;
        emit(MediaPicked(_mediaFile!, _isVideo));
      }
    } catch (e) {
      emit(MediaUploadError("Failed to pick media: \$e"));
    }
  }

  Future<void> uploadMedia() async {
    if (_mediaFile == null) {
      emit(MediaUploadError("No media selected"));
      return;
    }

    emit(MediaUploading());

    try {
      final fileExtension = _isVideo ? 'mp4' : 'jpg';
      final fileName = "\${DateTime.now().millisecondsSinceEpoch}.\$fileExtension";
      final path = 'uploads/\$fileName';

      await Supabase.instance.client.storage.from('media').upload(path, _mediaFile!);

      final mediaUrls = await getAllMedia();
      emit(MediaUploaded(mediaUrls));
    } catch (e) {
      emit(MediaUploadError("Upload Failed: \$e"));
    }
  }

  Future<List<String>> getAllMedia() async {
    try {
      final response = await Supabase.instance.client.storage.from('media').list(path: 'uploads');

      return response.map((file) {
        return Supabase.instance.client.storage.from('media').getPublicUrl('uploads/\${file.name}');
      }).toList();
    } catch (e) {
      emit(MediaUploadError("Error fetching media: \$e"));
      return [];
    }
  }
}
