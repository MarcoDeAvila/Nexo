import 'package:flutter/material.dart';
import '/backend/schema/enums/enums.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _showMenu = false;
  bool get showMenu => _showMenu;
  set showMenu(bool value) {
    _showMenu = value;
  }

  PageMenuOption? _MenuOption = PageMenuOption.Explorar;
  PageMenuOption? get MenuOption => _MenuOption;
  set MenuOption(PageMenuOption? value) {
    _MenuOption = value;
  }

  bool _showConversacion = false;
  bool get showConversacion => _showConversacion;
  set showConversacion(bool value) {
    _showConversacion = value;
  }

  bool _showMessageActions = false;
  bool get showMessageActions => _showMessageActions;
  set showMessageActions(bool value) {
    _showMessageActions = value;
  }

  bool _showDeleteChat = false;
  bool get showDeleteChat => _showDeleteChat;
  set showDeleteChat(bool value) {
    _showDeleteChat = value;
  }
}
