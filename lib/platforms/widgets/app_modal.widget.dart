import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thinkific/main.dart';

Future<T> showAppModal<T>(Widget child) async {
  return showCupertinoDialog<T>(
    context: appNavKey.currentContext,
    builder: (ctx) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      padding: const EdgeInsets.only(top: 16),
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(ctx).pop(null);
                      },
                    ),
                  ),
                  child,
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
