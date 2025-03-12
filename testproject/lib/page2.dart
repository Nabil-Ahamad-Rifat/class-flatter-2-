import 'package:flutter/material.dart';
import 'page3.dart'; // Import Page3 to navigate

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  double sliderValue = 20; // Default slider value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Slider Value: ${sliderValue.toInt()}'),
            Slider(
              min: -20,
              max: 400,
              divisions: 21,
              value: sliderValue,
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Page3()),
                );
              },
              child: Text('Go to Page 3'),
            ),
          ],
        ),
      ),
    );
  }
}
