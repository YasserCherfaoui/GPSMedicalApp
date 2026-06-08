import 'dart:convert';

/// Sandbox `gateway_token` for `stripe_test` confirm (base64 `succeed` | `fail`).
String sandboxGatewayToken({required bool succeed}) {
  return base64Encode(utf8.encode(succeed ? 'succeed' : 'fail'));
}
