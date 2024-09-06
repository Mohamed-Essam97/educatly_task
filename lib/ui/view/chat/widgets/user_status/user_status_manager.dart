import 'package:educatly/ui/services/user_status_service.dart';
import 'package:flutter/material.dart';

class UserStatusManager extends StatefulWidget {
  final Widget child;
  final String userId;

  const UserStatusManager({
    super.key,
    required this.child,
    required this.userId,
  });

  @override
  _UserStatusManagerState createState() => _UserStatusManagerState();
}

class _UserStatusManagerState extends State<UserStatusManager>
    with WidgetsBindingObserver {
  late UserStatusService _userStatusService;

  @override
  void initState() {
    super.initState();
    _userStatusService = UserStatusService(userId: widget.userId);
    WidgetsBinding.instance.addObserver(this);
    _setOnline();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _setOffline();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _setOnline();
    } else if (state == AppLifecycleState.paused) {
      _setOffline();
    }
  }

  Future<void> _setOnline() async {
    await _userStatusService.setOnline();
  }

  Future<void> _setOffline() async {
    await _userStatusService.setOffline();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
