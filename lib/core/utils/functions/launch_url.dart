import 'package:bookly2/core/utils/functions/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchurl(BuildContext context, String? url) async {
  if (url != null) {
    await launchUrl(
      Uri.parse(url),
    );
  } else {
    snackbar(context);
  }
}
