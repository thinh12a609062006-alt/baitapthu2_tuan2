import 'package:flutter/material.dart';

class Student {
  String name;
  String? email;
  String? phone;

  Student({
    required this.name,
    this.email,
    this.phone,
  });
}
final List<Student> students = [
  Student(
    name: 'Nguyễn Văn An',
    email: 'an@sv.edu.vn',
    phone: '0901 234 567',
  ),

  Student(
    name: 'Trần Thị Bình',
    phone: '0912 888 999',
  ),

  Student(
    name: 'Lê Minh Chi',
    email: 'chi@sv.edu.vn',
  ),

  Student(
    name: 'Phạm Quốc Dũng',
  ),

  Student(
    name: 'Võ Thanh Em',
    email: 'em@sv.edu.vn',
    phone: '0933 111 222',
  ),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const StudentScreen(),
    );
  }
}

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int missingEmail = 0;

    for (var student in students) {
      if (student.email == null) {
        missingEmail++;
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF304D82),
        foregroundColor: Colors.white,
        title: const Text(
          'Danh sách sinh viên',
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var student in students)
              Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        student.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        'Email: ${student.email ?? "Chưa cập nhật"}',
                      ),

                      const SizedBox(height: 4),

                      Text(
                        'SĐT: ${student.phone ?? "Chưa cập nhật"}',
                      ),
                    ],
                  ),
                ),
              ),

            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFE8EEF7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tổng: ${students.length} sinh viên',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    'Thiếu email: $missingEmail',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



