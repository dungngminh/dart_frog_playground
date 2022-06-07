import 'package:dart_frog/dart_frog.dart';

import '../../database/student_mock.dart';
import '../../model/student_model.dart';

Handler middleware(Handler handle) {
  return handle.use(
    provider<List<StudentModel>>(
      (_) => listStudent,
    ),
  );
}
