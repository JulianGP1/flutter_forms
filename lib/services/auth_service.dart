import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  Future<String?> register({
    required String nombre,
    required String email,
    required String password,
  }) async {
    try {
      final res = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      final user = res.user;

      if (user != null) {
         
        await supabase.from('users').insert({
          'id': user.id,
          'nombre': nombre,
          'email': email,
        });
        
      }

      return null;
    } catch (e) {
      return e.toString();
    }
  }

 
  Future<String?> loginWithNombre({
    required String nombre,
    required String password,
  }) async {
    try {
      
      final res = await supabase
    .from('users')
    .select('*')
    .eq('nombre', nombre)
    .maybeSingle();

 
      if (res == null) {
        return "Usuario no encontrado";
      }
      
      final email = res['email'];

 
      await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      return null;
    } catch (e) {
      return e.toString();
    }
  }
 
  Future<void> logout() async {
    await supabase.auth.signOut();
  }


  Session? get currentSession => supabase.auth.currentSession;
}