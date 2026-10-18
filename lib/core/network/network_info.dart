import 'dart:io';

/// Contract to check device internet connectivity.
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

/// Concrete implementation verifying actual internet connectivity.
class NetworkInfoImpl implements NetworkInfo {
  const NetworkInfoImpl();

  @override
  Future<bool> get isConnected async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }
}
