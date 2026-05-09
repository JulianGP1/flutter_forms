import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/providers/lenguaje_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this.ref) {
 
    ref.listen(languajeProvider, (_, __) {
      notifyListeners();
    });

 
    Supabase.instance.client.auth.onAuthStateChange.listen((event) {
      notifyListeners();
    });
  }

  final Ref ref;
}