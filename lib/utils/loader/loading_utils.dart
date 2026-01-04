import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/theme/app_colors.dart';

class LoadingUtils {
  // ORIGINAL VARIABLES (kept exactly as you had them)
  static int _loaderCount = 0;
  static OverlayEntry? _overlayEntry;

  // ORIGINAL SHOW LOADER (kept exactly the same)
  static void showLoader() {
    try {
      final shortStack = StackTrace.current
          .toString()
          .split('\n')
          .take(3)
          .join('\n');
      debugPrint(
        'LoadingUtils.showLoader() called. _loaderCount=$_loaderCount\n$shortStack',
      );
    } catch (_) {}

    _loaderCount++;
    if (_loaderCount == 1) {
      try {
        final ctx = Get.overlayContext ?? Get.context;
        if (ctx != null) {
          _overlayEntry = OverlayEntry(
            builder: (context) {
              return Material(
                color: Colors.black45,
                child: WillPopScope(
                  onWillPop: () async => false,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                      strokeWidth: 2,
                    ),
                  ),
                ),
              );
            },
          );

          Overlay.of(ctx).insert(_overlayEntry!);
          debugPrint('LoadingUtils.showLoader: inserted OverlayEntry');
          return;
        }
      } catch (e, st) {
        debugPrint(
          'LoadingUtils.showLoader: Overlay insertion failed: $e\n$st',
        );
      }

      // fallback to dialog
      Get.dialog(
        WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
              strokeWidth: 2,
            ),
          ),
        ),
        barrierDismissible: false,
      );
    }
  }

  // ORIGINAL HIDE LOADER (kept intact)
  static void hideLoader() {
    try {
      final shortStack = StackTrace.current
          .toString()
          .split('\n')
          .take(3)
          .join('\n');
      debugPrint(
        'LoadingUtils.hideLoader() called. _loaderCount=$_loaderCount\n$shortStack',
      );
    } catch (_) {}

    _loaderCount--;

    if (_loaderCount <= 0) {
      _loaderCount = 0;

      // ⭐ CASE 1 → Overlay exists → remove overlay ONLY
      if (_overlayEntry != null) {
        try {
          _overlayEntry?.remove();
          debugPrint('LoadingUtils.hideLoader: removed OverlayEntry');
        } catch (e, st) {
          debugPrint(
            'LoadingUtils.hideLoader: removing OverlayEntry failed: $e\n$st',
          );
        }
        _overlayEntry = null;

        // ⭐ IMPORTANT:
        // Do NOT call Get.back() here!
        return;
      }

      // ⭐ CASE 2 → No overlay → check if loader dialog is actually open
      if (Get.isDialogOpen ?? false) {
        try {
          Get.back(closeOverlays: true);
          debugPrint('LoadingUtils.hideLoader: loader dialog closed safely');
        } catch (e, st) {
          debugPrint('LoadingUtils.hideLoader: Get.back() error: $e\n$st');
        }
      } else {
        debugPrint("LoadingUtils.hideLoader: No dialog to close");
      }
    }
  }

  static void safeCloseLoader() {
    debugPrint("LoadingUtils.safeCloseLoader() → safely closing loader only");

    // Reset counter (loader no longer active)
    _loaderCount = 0;

    // Remove overlay safely
    if (_overlayEntry != null) {
      try {
        _overlayEntry?.remove();
        debugPrint("SAFE CLOSE: overlay removed");
      } catch (_) {}
      _overlayEntry = null;
    }

    // Close the dialog ONLY if it's the loader dialog
    if (Get.isDialogOpen ?? false) {
      try {
        final current = Get.routing.current;

        // Only close if it's the loader dialog, no route pop
        if (current.toString().contains("Dialog") ||
            current.toString().contains("loader") ||
            current.toString().isEmpty) {
          Get.back(closeOverlays: true);
          debugPrint("SAFE CLOSE: loader dialog closed");
        }
      } catch (_) {}
    }
  }

  // ORIGINAL FORCE HIDE (kept intact)
  static void forceHideAll() {
    try {
      debugPrint(
        'LoadingUtils.forceHideAll() called. current _loaderCount=$_loaderCount',
      );
    } catch (_) {}

    for (var i = 0; i < 3; i++) {
      try {
        Get.back();
        debugPrint(
          'LoadingUtils.forceHideAll: Get.back() attempt #${i + 1} succeeded',
        );
      } catch (e, st) {
        debugPrint(
          'LoadingUtils.forceHideAll: Get.back() attempt #${i + 1} threw: $e\n$st',
        );
        break;
      }
    }

    _loaderCount = 0;
    _overlayEntry = null;
  }

  // ⭐⭐⭐ NEW GLOBAL CLOSE METHOD (Your requested feature)
  static void closeGlobally() {
    debugPrint("LoadingUtils.closeGlobally() → force close loader everywhere");

    _loaderCount = 0;

    // remove overlay if exists
    if (_overlayEntry != null) {
      try {
        _overlayEntry?.remove();
        debugPrint("GLOBAL CLOSE: overlay removed");
      } catch (_) {}
      _overlayEntry = null;
    }

    // close any dialog that loader opened
    if (Get.isDialogOpen ?? false) {
      try {
        Get.back(closeOverlays: true);
        debugPrint("GLOBAL CLOSE: dialog closed");
      } catch (_) {}
    }
  }
}
