import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OriginalDesignButton extends StatefulWidget {
  final String url;

  const OriginalDesignButton({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  _OriginalDesignButtonState createState() => _OriginalDesignButtonState();
}

class _OriginalDesignButtonState extends State<OriginalDesignButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => launch(widget.url),
      child: Row(
        children: [
          const Text('Original Design'),
          const SizedBox(width: 8),
          Transform(
            transform: Matrix4.rotationY(pi),
            origin: const Offset(12, 0),
            child: const Icon(Icons.reply),
          ),
        ],
      ),
    );
  }
}
