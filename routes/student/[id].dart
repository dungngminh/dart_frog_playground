import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../../model/student_model.dart';

Future<Response> onRequest(RequestContext context) async {
  await Future<void>.delayed(const Duration(milliseconds: 300));
  final id = context.request.url.path;
  final listStudent = context.read<List<StudentModel>>();
  try {
    final student = listStudent.firstWhere(
      (student) => student.id == int.parse(id),
    );
    return Response.json(
      body: <String, dynamic>{
        'status': HttpStatus.ok,
        'students': student.toJson(),
      },
    );
  } catch (e) {
    return Response.json(
      statusCode: HttpStatus.noContent,
      body: <String, dynamic>{
        'status': HttpStatus.noContent,
        'students': 'not found student',
      },
    );
  }
}
