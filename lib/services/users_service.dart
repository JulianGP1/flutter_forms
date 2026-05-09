import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserService {
  final supabase = Supabase.instance.client;

 
  Future<Map<String, dynamic>?> getUserData() async {
    final user = supabase.auth.currentUser;

    if (user == null) return null;

    final response = await supabase
        .from('users')
        .select()
        .eq('id', user.id)
        .single();

    return response;
  }

 
  Future<String?> uploadAvatar() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile == null) return null;

  final file = File(pickedFile.path);
  final user = supabase.auth.currentUser;

  if (user == null) return null;

  final filePath = 'avatars/${user.id}.jpg';

  await supabase.storage
      .from('avatars')
      .upload(
        filePath,
        file,
        fileOptions: const FileOptions(
          cacheControl: '3600',
          upsert: true,
        ),
      );

  final publicUrl =
      supabase.storage.from('avatars').getPublicUrl(filePath);

  return publicUrl;
}

 
  Future<void> saveAvatarUrl(String url) async {
    final user = supabase.auth.currentUser;

    await supabase
        .from('users')
        .update({'avatar_url': url})
        .eq('id', user!.id);
  }
}