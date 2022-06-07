import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../../config/constant.dart';
import '../../model/student_model.dart';

Future<Response> onRequest(RequestContext context) async {
  final listStudent = context.read<List<StudentModel>>();
  final query = context.request.url.queryParameters;
  final name = query['name'];
  final tech = query['tech'];
  await Future<void>.delayed(const Duration(milliseconds: 300));
  if (name != null) {
    final listByName = listStudent
        .where(
          (e) => e.name.toLowerCase().contains(name.toLowerCase()),
        ) //phong 7 tang 2 ngoai chan thuong
        .toList();
    return Response.json(
      statusCode: listByName.isNotEmpty ? HttpStatus.ok : HttpStatus.noContent,
      body: <String, dynamic>{
        'status': listByName.isNotEmpty ? HttpStatus.ok : HttpStatus.noContent,
        'message': listByName.isNotEmpty
            ? MessageResponse.listNotEmpty
            : MessageResponse.listEmpty,
        'students': listByName.map((e) => e.toJson()).toList(),
      },
    );
  } else if (tech != null) {
    final listByTech = listStudent
        .where((e) => e.mainTech.toLowerCase().contains(tech.toLowerCase()))
        .toList();
    return Response.json(
      statusCode: listByTech.isNotEmpty ? HttpStatus.ok : HttpStatus.noContent,
      body: <String, dynamic>{
        'status': listByTech.isNotEmpty ? HttpStatus.ok : HttpStatus.noContent,
        'message': listByTech.isNotEmpty
            ? MessageResponse.listNotEmpty
            : MessageResponse.listEmpty,
        'students': listByTech.map((e) => e.toJson()).toList(),
      },
    );
    // ignore: invariant_booleans
  } else if (tech != null && name != null) {
    final listTechAndName = listStudent
        .where(
          (e) =>
              e.mainTech.toLowerCase().contains(tech.toLowerCase()) &&
              e.name.toLowerCase().contains(name.toLowerCase()),
        )
        .toList();
    print(listTechAndName);
    return Response.json(
      statusCode:
          listTechAndName.isNotEmpty ? HttpStatus.ok : HttpStatus.noContent,
      body: <String, dynamic>{
        'status':
            listTechAndName.isNotEmpty ? HttpStatus.ok : HttpStatus.noContent,
        'message': listTechAndName.isNotEmpty
            ? MessageResponse.listNotEmpty
            : MessageResponse.listEmpty,
        'students': listTechAndName.map((e) => e.toJson()).toList(),
      },
    );
  } else {
    return Response.json(
      statusCode: listStudent.isNotEmpty ? HttpStatus.ok : HttpStatus.noContent,
      body: <String, dynamic>{
        'status': listStudent.isNotEmpty ? HttpStatus.ok : HttpStatus.noContent,
        'message': listStudent.isNotEmpty
            ? MessageResponse.listNotEmpty
            : MessageResponse.listEmpty,
        'students': listStudent.map((e) => e.toJson()).toList(),
      },
    );
  }
}
