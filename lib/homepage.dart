import 'package:flutter/material.dart';
import 'career page.dart'; // Import the CareerPage
import 'about_page.dart'; // Import the AboutPage
import 'teacher_detail_page.dart'; // Import the TeacherDetailPage
import 'group.dart'; // Import the GroupPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teachers & Career',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFF003F63),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF003F63)),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const TeachersPage(), // Teachers Page
    const Center(
      child: Text(
        'Career',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
    const Center(
      child: Text(
        'About',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
    const Center(
      child: Text(
        'Groups',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  ];

  void _onTabTapped(int index) {
    if (index == 1) {
      // Navigate to CareerPage when "Career" icon is clicked
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CareerPage()),
      );
    } else if (index == 2) {
      // Navigate to AboutPage when "About" icon is clicked
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AboutPage()),
      );
    } else if (index == 3) {
      // Navigate to GroupPage when "Groups" icon is clicked
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const GroupPage()),
      );
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF003F63),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE64833),
        title: const Text(
          'Teachers & Career',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF7091E6),
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Teachers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Career',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Groups',
          ),
        ],
      ),
    );
  }
}

class TeachersPage extends StatefulWidget {
  const TeachersPage({super.key});

  @override
  _TeachersPageState createState() => _TeachersPageState();
}

class _TeachersPageState extends State<TeachersPage> {
  final List<Map<String, String>> _teachers = [
    {'name': 'Blessed Prince', 'image': 'assets/teacher 1.jpg', 'availability': 'Monday:10 to 12 , Friday:10 to 11', 'timetable': 'assets/timetable.png'},
    {'name': 'Anad Raj', 'image': 'assets/teacher 2.jpg', 'availability': 'Monday - Wednesday', 'timetable': 'assets/timetable.png'},
    {'name': 'Hello', 'image': 'assets/teacher 3.jpg', 'availability': 'Tuesday - Friday', 'timetable': 'assets/timetable.png'},
    {'name': 'King', 'image': 'assets/teacher 4.jpg', 'availability': 'Monday - Thursday', 'timetable': 'assets/timetable.png'},
    {'name': 'Pavan', 'image': 'assets/teacher 5.jpg', 'availability': 'Wednesday - Friday', 'timetable': 'assets/timetable.png'},
    {'name': 'Kumar', 'image': 'assets/teacher 6.jpg', 'availability': 'Monday - Friday', 'timetable': 'assets/timetable.png'},
    {'name': 'Reddy', 'image': 'assets/teacher 7.jpg', 'availability': 'Tuesday - Thursday', 'timetable': 'assets/timetable.png'},
    {'name': 'Glory', 'image': 'assets/teacher 8.jpg', 'availability': 'Monday - Friday', 'timetable': 'assets/timetable.png'},
  ];

  List<Map<String, String>> _filteredTeachers = [];

  @override
  void initState() {
    super.initState();
    _filteredTeachers = _teachers;
  }

  void _filterTeachers(String query) {
    setState(() {
      _filteredTeachers = _teachers
          .where((teacher) => teacher['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _navigateToDetailPage(Map<String, String> teacher) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TeacherDetailPage(
          name: teacher['name']!,
          image: teacher['image']!,
          availability: teacher['availability']!,
          timetable: teacher['timetable']!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            'THIS is the place you can find teachers\' cabins',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.grey),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    onChanged: _filterTeachers,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search for teachers...',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: _filteredTeachers.isEmpty
                ? const Center(
                    child: Text(
                      'No teacher found',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFE64833),
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: _filteredTeachers.length,
                    itemBuilder: (context, index) {
                      final teacher = _filteredTeachers[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(teacher['image']!),
                            radius: 30.0,
                          ),
                          title: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  teacher['name']!,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          onTap: () => _navigateToDetailPage(teacher),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
