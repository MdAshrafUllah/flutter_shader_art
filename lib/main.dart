import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

void main() {
  runApp(const ShaderArt());
}

class ShaderArt extends StatelessWidget {
  const ShaderArt({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShaderArt',
      home: const ShaderScreen(),
    );
  }
}

class ShaderScreen extends StatefulWidget {
  const ShaderScreen({super.key});

  @override
  State<ShaderScreen> createState() => _ShaderScreenState();
}

class _ShaderScreenState extends State<ShaderScreen> {
  double val1 = 1.0;
  double val2 = 1.0;
  double time = 0;

  @override
  void initState() {
    super.initState();
    Stream.periodic(Duration(milliseconds: 16)).listen((_) {
      setState(() {
        time += 0.01;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          ShaderBuilder((context, shader, child) {
            return AnimatedSampler((image, size, canvas) {
              shader.setFloat(0, size.width);
              shader.setFloat(1, size.height);
              shader.setFloat(2, time);
              shader.setFloat(3, val1);
              shader.setFloat(4, val2);
              canvas.drawRect(
                Rect.fromLTWH(0, 0, size.width, size.height),
                Paint()..shader = shader,
              );
            }, child: Container());
          }, assetKey: 'assets/shaders/shader.frag'),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Slider(
                  value: val1,
                  min: 0.1,
                  max: 3.0,
                  onChanged: (v) => setState(() => val1 = v),
                ),
                Slider(
                  value: val2,
                  min: 0.1,
                  max: 2.0,
                  onChanged: (v) => setState(() => val2 = v),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
