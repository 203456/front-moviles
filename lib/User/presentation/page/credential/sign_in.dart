import 'package:brilliant_app/User/presentation/widgets/form_container.dart';
import 'package:brilliant_app/const.dart';
import 'package:flutter/material.dart';

class SingIn extends StatelessWidget {
  const SingIn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Stack(children: [
              Center(
                  child: Image.asset('assets/BrillantLogo.png',
                      width: double.infinity)),
              LoginForm(),
            ]),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final BoxConstraints? viewportConstraints;

  const LoginForm({
    super.key,
    this.viewportConstraints,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Login',
            style: TextStyle(
                color: primaryColor,
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                      color: black.withOpacity(.25), offset: const Offset(3, 4))
                ]),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: FormContainer(
              hintText: 'Username',
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 30.0),
            child: FormContainer(
              hintText: 'Password',
              isPasswordFiel: true,
            ),
          ),
          Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(10.0)),
            child: CustomPaint(painter: TriangulePainter()),
          )
        ],
      ),
    );
  }
}

class TriangulePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(25, 25);
    path.conicTo(78, 49, 50, size.height * 2 / 3, 6);
    path.moveTo(25, 75);
    path.conicTo(25, 20, 50, size.height * 1 / 3, 6);
    path.moveTo(75, 50);
    path.conicTo(25, 80, 25, 50, 6);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
