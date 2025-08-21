import 'package:flutter_riverpod/flutter_riverpod.dart';

class SourcesController extends Notifier<List<String>> {
  @override
  List<String> build() {
    return [];
  }

  void toggleSource(String source) {
    if (state.contains(source)) {
      state = [
        for (final c in state)
          if (c != source) c,
      ];
    } else {
      state = [...state, source];
    }
  }

  void unSelectAll() {
    state = [];
  }
}

final sourcesControllerProvider = NotifierProvider(() => SourcesController());
