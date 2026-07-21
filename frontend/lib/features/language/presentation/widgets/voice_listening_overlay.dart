import 'package:flutter/material.dart';

class VoiceListeningOverlay extends StatelessWidget {
  final bool isListening;
  final String recognizedText;
  final VoidCallback? onCancel;

  const VoiceListeningOverlay({
    super.key,
    required this.isListening,
    required this.recognizedText,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {

    if (!isListening) {
      return const SizedBox.shrink();
    }


    return Container(
      color: Colors.black54,

      alignment: Alignment.center,


      child: Container(

        width: 330,

        padding:
            const EdgeInsets.all(26),

        margin:
            const EdgeInsets.symmetric(
          horizontal: 24,
        ),


        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius:
              BorderRadius.circular(26),

          boxShadow: [

            BoxShadow(
              color:
                  Colors.black.withOpacity(.15),

              blurRadius: 20,

              offset:
                  const Offset(0, 10),
            ),

          ],
        ),


        child: Column(

          mainAxisSize:
              MainAxisSize.min,


          children: [

            const Text(

              "सुन रहे हैं...",

              style: TextStyle(

                fontSize: 24,

                fontWeight:
                    FontWeight.w800,

                color:
                    Color(0xff165C34),
              ),
            ),


            const SizedBox(height: 8),


            Text(

              "Speak your language",

              style: TextStyle(

                fontSize: 15,

                color:
                    Colors.grey.shade600,
              ),
            ),



            const SizedBox(height: 30),



            TweenAnimationBuilder<double>(

              tween:
                  Tween(
                    begin: 0.85,
                    end: 1.15,
                  ),


              duration:
                  const Duration(
                    milliseconds: 900,
                  ),


              curve:
                  Curves.easeInOut,


              builder:
                  (context, scale, child) {

                return Transform.scale(

                  scale: scale,

                  child: child,

                );

              },


              child: Container(

                width: 100,

                height: 100,


                decoration:
                    const BoxDecoration(

                  color:
                      Color(0xff165C34),

                  shape:
                      BoxShape.circle,
                ),


                child:
                    const Icon(

                  Icons.mic_rounded,

                  color:
                      Colors.white,

                  size:
                      48,
                ),
              ),
            ),



            const SizedBox(height: 30),



            Container(

              width:
                  double.infinity,


              padding:
                  const EdgeInsets.all(14),


              decoration:
                  BoxDecoration(

                color:
                    const Color(0xffF6F5F2),

                borderRadius:
                    BorderRadius.circular(16),
              ),


              child:
                  Text(

                recognizedText.isEmpty

                    ? "जैसे बोलें: Hindi, Tamil, Marathi..."

                    : recognizedText,


                textAlign:
                    TextAlign.center,


                style:
                    TextStyle(

                  fontSize:
                      16,

                  color:
                      recognizedText.isEmpty

                          ? Colors.grey.shade600

                          : Colors.black87,

                  fontWeight:
                      FontWeight.w500,
                ),
              ),
            ),



            const SizedBox(height: 28),



            SizedBox(

              width:
                  double.infinity,


              height:
                  52,


              child:
                  ElevatedButton(

                onPressed:
                    onCancel,


                style:
                    ElevatedButton.styleFrom(

                  backgroundColor:
                      Colors.redAccent,


                  foregroundColor:
                      Colors.white,


                  elevation:
                      0,


                  shape:
                      RoundedRectangleBorder(

                    borderRadius:
                        BorderRadius.circular(16),
                  ),
                ),


                child:
                    const Text(

                  "Cancel",

                  style:
                      TextStyle(

                    fontSize:
                        16,

                    fontWeight:
                        FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}