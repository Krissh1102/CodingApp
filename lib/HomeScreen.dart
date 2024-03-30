import 'package:flutter/material.dart';

class HomeScren extends StatefulWidget {
  const HomeScren({super.key});

  @override
  State<HomeScren> createState() => _HomeScrenState();
}

class _HomeScrenState extends State<HomeScren> {
  final List<Map<String, dynamic>> _items = [
    {"value": "C", "icon": 'assets/images/download-removebg-preview.png'},
    {"value": "C++", "icon": 'assets/images/download-removebg-preview(1).png'},
    {
      "value": "Python",
      "icon": 'assets/images/download-removebg-preview(2).png'
    },
    {"value": "Java", "icon": 'assets/images/download-removebg-preview(3).png'},
  ];
  TextEditingController _controller = TextEditingController();
  Map<String, dynamic>? _selectedItem;

  int _lineCount = 1;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateLineCount);
  }

  @override
  void dispose() {
    _controller.removeListener(_updateLineCount);
    _controller.dispose();
    super.dispose();
  }

  void _updateLineCount() {
    final lines = _controller.text.split('\n');
    setState(() {
      _lineCount = lines.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: const Text('Code'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: 80,
                height: 5,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white, // Text color
                  ),
                  child: const Text('Run'),
                )),
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 200,
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Map<String, dynamic>>(
                    value: _selectedItem,
                    onChanged: (value) {
                      print('Selected: ${value!["value"]}');
                      setState(() {
                        _selectedItem = value;
                      });
                    },
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 36.0,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black, fontSize: 18.0),
                    hint: const Text('Select Language'),
                    items: _items
                        .map<DropdownMenuItem<Map<String, dynamic>>>((item) {
                      return DropdownMenuItem<Map<String, dynamic>>(
                        value: item,
                        child: Row(
                          children: [
                            Image.asset(item['icon']),
                            const SizedBox(width: 5),
                            Text(
                              item['value'],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Code',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'No errors found',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: TextField(
                  controller: _controller,
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  onChanged: (_) => _updateLineCount(),
                  decoration: InputDecoration(
                    prefix: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        _lineCount,
                        (index) => Text('${index + 1} ',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 114, 192, 255))),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusColor: Colors.black,
                    hintText: 'Enter your code here',
                    fillColor: const Color.fromARGB(255, 162, 162, 0),
                    filled: true,
                    isCollapsed: true,
                    contentPadding: const EdgeInsets.only(left: 8, top: 8),
                    alignLabelWithHint: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Output',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: TextField(
                  maxLines: null,
                  expands: true,
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: null,
                    focusColor: Colors.black,
                    hintText: 'Output',
                    fillColor: const Color.fromARGB(255, 0, 111, 119),
                    filled: true,
                    isCollapsed: true,
                    alignLabelWithHint: true,
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                  child: SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white, // Text color
                        ),
                        child: const Text(
                          'Submit Code',
                          style: TextStyle(fontSize: 15),
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
