import 'package:flutter/material.dart';


class CounterFuctionsScreen extends StatefulWidget {


  const CounterFuctionsScreen({super.key});

  @override
  State<CounterFuctionsScreen> createState() => _CounterFuctionsScreenState();
}


class _CounterFuctionsScreenState extends State<CounterFuctionsScreen> {

  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Counter functions'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            }),
        ],

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clickCounter', 
            style: const TextStyle( 
              fontSize: 160, fontWeight: FontWeight.w100 ) ),
            if (clickCounter == 1)
             const Text('Click', style: TextStyle( fontSize: 25) ),
            if (clickCounter != 1)
             const Text('Clicks', style: TextStyle( fontSize: 25) )
          ],
        ),
      ),
      floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.refresh_rounded,
              onPressed: () {
                clickCounter = 0;
                setState(() {});
              },
            ),
            const SizedBox(height: 10),
            CustomButton(
              icon: Icons.exposure_minus_1_outlined,
              onPressed: () {
                if (clickCounter == 0) return;
                clickCounter--;
                setState(() {});
              },
            ),
            const SizedBox(height: 10),
            CustomButton(
              icon: Icons.plus_one,
              onPressed: () {
                clickCounter++;
                setState(() {});
              },
            ),
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,
  });
   @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // shape: const StadiumBorder(),
      enableFeedback: true,
      elevation: 5,
      splashColor: Colors.pink,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}