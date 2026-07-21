import 'package:flutter/material.dart';

class SpeakerButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isSpeaking;
  final double size;

  const SpeakerButton({
    super.key,
    required this.onPressed,
    this.isSpeaking = false,
    this.size = 52,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "सुनें",

      child: Material(
        color: Colors.transparent,

        child: InkWell(
          onTap: onPressed,

          borderRadius:
              BorderRadius.circular(30),

          child: AnimatedContainer(
            duration:
                const Duration(milliseconds: 300),

            curve: Curves.easeInOut,

            width: size,

            height: size,

            decoration: BoxDecoration(

              color: isSpeaking
                  ? const Color(0xff165C34)
                  : Colors.white,

              borderRadius:
                  BorderRadius.circular(30),


              boxShadow: [

                BoxShadow(
                  color:
                      Colors.black.withOpacity(.08),

                  blurRadius: 12,

                  offset:
                      const Offset(0, 5),
                ),

              ],
            ),


            child: AnimatedScale(

              scale:
                  isSpeaking ? 1.12 : 1.0,

              duration:
                  const Duration(milliseconds: 500),

              curve:
                  Curves.easeInOut,

              child: Icon(

                isSpeaking
                    ? Icons.volume_up_rounded
                    : Icons.volume_up_outlined,


                color:

                    isSpeaking
                        ? Colors.white
                        : const Color(0xff165C34),


                size: 26,
              ),
            ),
          ),
        ),
      ),
    );
  }
}