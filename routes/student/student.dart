import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../../model/student_model.dart';

Future<Response> onRequest(RequestContext context) async {
  await Future<void>.delayed(const Duration(milliseconds: 300));
  final listStudent = context.read<List<StudentModel>>();
  return Response.json(
    body: <String, dynamic>{
      'status': HttpStatus.ok,
      'students':
          listStudent.map((e) => e.toJson()).toList(),
    },
  );
}
