import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../language/presentation/providers/language_provider.dart';


import '../../../../generated/app_localizations.dart';


import '../widgets/language_switch_button.dart';
import '../widgets/welcome_message_card.dart';
import '../widgets/auth_option_card.dart';
import '../widgets/voice_auth_card.dart';


import 'register_screen.dart';





class LoginScreen extends ConsumerWidget {


  const LoginScreen({

    super.key,

  });







  void _handleVoiceCommand(


    BuildContext context,


    String text,


    AuthTextModel texts,


  ) {



    final command =

        text.toLowerCase().trim();







    final createAccountMatch =

        texts.createAccountKeywords.any(

      (keyword) =>

          command.contains(

            keyword.toLowerCase(),

          ),

    );







    final loginMatch =

        texts.loginKeywords.any(

      (keyword) =>

          command.contains(

            keyword.toLowerCase(),

          ),

    );







    if (createAccountMatch) {


      Navigator.push(

        context,

        MaterialPageRoute(

          builder: (_) =>

              const RegisterScreen(),

        ),

      );


      return;

    }








    if (loginMatch) {


      ScaffoldMessenger.of(context)
          .showSnackBar(



        SnackBar(

          content:

              Text(

                texts.loginOpeningText,

              ),

        ),



      );


    }


  }









  @override
  Widget build(

    BuildContext context,

    WidgetRef ref,

  ) {



    final selectedLanguage =

        ref.watch(languageProvider);





    final texts =

        authTexts[selectedLanguage.code]

        ??

        authTexts["hi"]!;








    return Scaffold(



      backgroundColor:

          const Color(0xffFFF9EE),






      body: SafeArea(



        child: SingleChildScrollView(



          padding:

              const EdgeInsets.symmetric(

                horizontal:18,

                vertical:12,

              ),






          child: Column(



            children: [







              Row(



                mainAxisAlignment:

                    MainAxisAlignment.spaceBetween,





                children: [







                  Row(



                    children: [





                      Container(



                        height:

                            58,



                        width:

                            58,



                        padding:

                            const EdgeInsets.all(8),





                        decoration:

                            BoxDecoration(



                          color:

                              Colors.white,



                          borderRadius:

                              BorderRadius.circular(16),



                        ),





                        child:

                            Image.asset(

                              "assets/images/kamaai_logo.png",

                            ),



                      ),







                      const SizedBox(width:10),







                      const Text(



                        "Kamaai",



                        style: TextStyle(



                          fontSize:

                              26,



                          fontWeight:

                              FontWeight.w900,



                          color:

                              Color(0xff165C34),



                        ),



                      ),





                    ],



                  ),







                  LanguageSwitchButton(



                    title:

                        texts.languageChangeText,



                    hinglishText:

                        texts.languageChangeHinglish,



                  ),






                ],



              ),







              const SizedBox(height:16),







              WelcomeMessageCard(



                language:

                    selectedLanguage,



              ),







              const SizedBox(height:16),







              Row(



                children: [







                  Expanded(



                    child: AuthOptionCard(



                      icon:

                          Icons.person_add_alt_1_rounded,



                      title:

                          texts.createAccountShort,



                      hinglishText:

                          texts.createAccountHinglish,



                      color:

                          const Color(0xff165C34),




                      onTap: () {



                        Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder: (_) =>

                                const RegisterScreen(),

                          ),

                        );



                      },



                    ),



                  ),







                  const SizedBox(width:10),







                  Expanded(



                    child: AuthOptionCard(



                      icon:

                          Icons.lock_outline_rounded,



                      title:

                          texts.loginShort,



                      hinglishText:

                          texts.loginHinglish,



                      color:

                          const Color(0xffD9822B),





                      onTap: () {



                        ScaffoldMessenger.of(context)
                            .showSnackBar(



                          SnackBar(

                            content:

                                Text(

                                  texts.loginOpeningText,

                                ),

                          ),



                        );



                      },



                    ),



                  ),






                ],



              ),







              const SizedBox(height:16),







              VoiceAuthCard(



                texts:

                    texts,



                onVoiceResult: (text) {



                  _handleVoiceCommand(

                    context,

                    text,

                    texts,

                  );



                },



              ),






            ],



          ),



        ),



      ),



    );


  }


}