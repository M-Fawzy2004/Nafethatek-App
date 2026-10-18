import 'package:url_launcher/url_launcher.dart';

/// Helper utility for opening external communications (phone calls, WhatsApp).
abstract class UrlLauncherHelper {
  /// Launches a direct phone call.
  static Future<bool> makePhoneCall(String phoneNumber) async {
    final cleanNumber = phoneNumber.replaceAll(RegExp(r'\s+'), '');
    final Uri uri = Uri(scheme: 'tel', path: cleanNumber);
    if (await canLaunchUrl(uri)) {
      return await launchUrl(uri);
    }
    return false;
  }

  /// Opens a WhatsApp chat with prefilled message if provided.
  static Future<bool> openWhatsApp(String phoneNumber, {String message = ''}) async {
    // Strip non-numeric characters except leading '+'
    final cleanNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
    final String encodedMsg = Uri.encodeComponent(message);
    final Uri uri = Uri.parse('https://wa.me/$cleanNumber?text=$encodedMsg');

    if (await canLaunchUrl(uri)) {
      return await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
    return false;
  }

  /// Opens an external URL in browser.
  static Future<bool> openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      return await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
    return false;
  }
}
