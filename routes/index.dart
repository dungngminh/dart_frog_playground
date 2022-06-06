import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  final welcome = context.read<String>();
  return Response.json(body: <String, dynamic>{'hello': welcome});
}
