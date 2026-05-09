import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserService {
  final supabase = Supabase.instance.client;

  Future<String?> uploadAvatar() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return null;

    final file = File(pickedFile.path);
    final user = supabase.auth.currentUser;

    final filePath = 'avatars/${user!.id}.jpg';

    await supabase.storage
        .from('avatars')
        .upload(filePath, file, fileOptions: const FileOptions(upsert: true));

    final imageUrl = supabase.storage
        .from('avatars')
        .getPublicUrl(filePath);

    return imageUrl;
  }
}