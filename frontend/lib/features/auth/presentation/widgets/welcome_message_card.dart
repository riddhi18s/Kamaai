import 'package:flutter/material.dart';

import '../../../../core/localization/language_model.dart';
import '../../../language/data/tts_service.dart';

import '../../data/auth_text_data.dart';
import '../../domain/auth_text_model.dart';



class WelcomeMessageCard extends StatefulWidget {


  final LanguageModel language;



  const WelcomeMessageCard({

    super.key,

    required this.language,

  });



  @override
  State<WelcomeMessageCard> createState() =>
      _WelcomeMessageCardState();

}







class _WelcomeMessageCardState
    extends State<WelcomeMessageCard> {



  bool _isSpeaking = false;





  AuthTextModel get texts =>

      authTexts[widget.language.code]

      ??

      authTexts["hi"]!;









  Future<void> _speakPage() async {



    if (_isSpeaking) {


      await TTSService.stop();



      if (!mounted) return;



      setState(() {

        _isSpeaking = false;

      });



      return;

    }







    setState(() {

      _isSpeaking = true;

    });






    await TTSService.initialize();





    await TTSService.speak(



      text:

          texts.fullPageSpeechText,



      languageCode:

          widget.language.localeCode,





      onComplete: () {



        if (!mounted) return;




        setState(() {

          _isSpeaking = false;

        });



      },



    );



  }









  @override
  void dispose() {


    TTSService.stop();


    super.dispose();

  }










  @override
  Widget build(BuildContext context) {



    return Container(



      width:

          double.infinity,



      padding:

          const EdgeInsets.all(24),







      decoration: BoxDecoration(



        color:

            Colors.white,



        borderRadius:

            BorderRadius.circular(26),





        boxShadow: [



          BoxShadow(



            color:

                Colors.black.withOpacity(.06),



            blurRadius:

                18,



            offset:

                const Offset(0,8),



          ),



        ],



      ),







      child: Column(



        children: [







          GestureDetector(



            onTap:

                _speakPage,





            child: AnimatedContainer(



              duration:

                  const Duration(milliseconds:300),





              height:

                  62,



              width:

                  62,







              decoration: BoxDecoration(



                shape:

                    BoxShape.circle,





                color:



                    _isSpeaking

                    ? const Color(0xff165C34)

                    : const Color(0xffF6F5F2),



              ),






              child: Icon(



                _isSpeaking

                    ? Icons.volume_up_rounded

                    : Icons.volume_up_outlined,





                size:

                    34,





                color:



                    _isSpeaking

                    ? Colors.white

                    : const Color(0xff165C34),



              ),



            ),



          ),








          const SizedBox(height:24),







          Text(



            texts.welcomeTitle,



            textAlign:

                TextAlign.center,





            style: const TextStyle(



              fontSize:

                  22,



              fontWeight:

                  FontWeight.w800,



              color:

                  Color(0xff165C34),



            ),



          ),








          const SizedBox(height:10),








          Text(



            texts.welcomeHinglish,



            textAlign:

                TextAlign.center,





            style: TextStyle(



              fontSize:

                  16,



              color:

                  Colors.grey.shade700,



              fontWeight:

                  FontWeight.w600,



            ),



          ),







          const SizedBox(height:22),







          Divider(



            color:

                Colors.grey.shade200,



          ),







          const SizedBox(height:18),







          Text(



            texts.instructionText,



            textAlign:

                TextAlign.center,





            style: const TextStyle(



              fontSize:

                  16,



              fontWeight:

                  FontWeight.w700,



            ),



          ),







          const SizedBox(height:8),







          Text(



            texts.instructionHinglish,



            textAlign:

                TextAlign.center,





            style: TextStyle(



              fontSize:

                  14,



              color:

                  Colors.grey.shade700,



            ),



          ),





        ],



      ),



    );

  }

}