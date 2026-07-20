import 'package:flutter/material.dart';

import '../../../language/data/stt_service.dart';

import '../../domain/auth_text_model.dart';



class VoiceAuthCard extends StatefulWidget {


  final AuthTextModel texts;

  final Function(String text) onVoiceResult;



  const VoiceAuthCard({

    super.key,

    required this.texts,

    required this.onVoiceResult,

  });



  @override
  State<VoiceAuthCard> createState() =>
      _VoiceAuthCardState();

}






class _VoiceAuthCardState
    extends State<VoiceAuthCard> {



  bool _isListening = false;

  String _recognizedText = "";








  Future<void> _startListening() async {


    setState(() {

      _isListening = true;

      _recognizedText = "";

    });





    await STTService.initialize();






    await STTService.startListening(



      localeId:

          widget.texts.speechLocale,





      onResult: (text) async {



        if (!mounted) return;





        setState(() {

          _recognizedText = text;

        });






        if (text.trim().isNotEmpty) {



          widget.onVoiceResult(text);





          await _stopListening();



        }



      },






      onComplete: () {



        if (!mounted) return;





        setState(() {

          _isListening = false;

        });



      },



    );


  }










  Future<void> _stopListening() async {



    await STTService.stopListening();





    if (!mounted) return;





    setState(() {

      _isListening = false;

    });



  }









  @override
  Widget build(BuildContext context) {



    return Container(



      width:

          double.infinity,



      padding:

          const EdgeInsets.all(18),





      decoration: BoxDecoration(



        color:

            Colors.white,



        borderRadius:

            BorderRadius.circular(24),





        boxShadow: [



          BoxShadow(



            color:

                Colors.black.withOpacity(.06),



            blurRadius:

                15,



            offset:

                const Offset(0,6),



          ),



        ],



      ),






      child: Column(



        children: [







          GestureDetector(



            onTap:

                _isListening

                ? _stopListening

                : _startListening,







            child: AnimatedContainer(



              duration:

                  const Duration(milliseconds:300),





              height:

                  78,



              width:

                  78,







              decoration: BoxDecoration(



                shape:

                    BoxShape.circle,





                color:



                    _isListening

                    ? const Color(0xff165C34)

                    : const Color(0xffF6F5F2),





                boxShadow: [



                  BoxShadow(



                    color:

                        Colors.black.withOpacity(.08),



                    blurRadius:

                        10,



                    offset:

                        const Offset(0,4),



                  ),



                ],



              ),






              child: Icon(



                _isListening

                    ? Icons.mic

                    : Icons.mic_none_rounded,





                size:

                    40,





                color:



                    _isListening

                    ? Colors.white

                    : const Color(0xff165C34),



              ),



            ),



          ),







          const SizedBox(height:14),







          Text(



            widget.texts.voiceText,



            textAlign:

                TextAlign.center,





            style: const TextStyle(



              fontSize:

                  20,



              fontWeight:

                  FontWeight.w800,



              color:

                  Color(0xff165C34),



            ),



          ),







          const SizedBox(height:4),







          Text(



            widget.texts.voiceHinglish,



            textAlign:

                TextAlign.center,





            style: TextStyle(



              fontSize:

                  14,



              fontWeight:

                  FontWeight.w600,



              color:

                  Colors.grey.shade700,



            ),



          ),







          if (_isListening) ...[






            const SizedBox(height:12),







            Text(



              widget.texts.voiceListeningText,



              style: const TextStyle(



                color:

                    Color(0xff165C34),



                fontWeight:

                    FontWeight.w700,



              ),



            ),








            TextButton(



              onPressed:

                  _stopListening,



              child: Text(



                widget.texts.voiceCancelText,



                style: const TextStyle(



                  color:

                      Colors.red,



                ),



              ),



            ),



          ],







          if (_recognizedText.isNotEmpty) ...[







            const SizedBox(height:8),






            Text(



              _recognizedText,



              textAlign:

                  TextAlign.center,





              maxLines:

                  2,



              overflow:

                  TextOverflow.ellipsis,





              style: const TextStyle(



                fontWeight:

                    FontWeight.w600,



              ),



            ),



          ],




        ],



      ),



    );


  }


}