import 'package:flutter/material.dart';

import 'package:kamaai/generated/app_localizations.dart';
import '../../../language/presentation/screens/language_selection_screen.dart';



class LanguageSwitchButton extends StatelessWidget {


  const LanguageSwitchButton({

    super.key,

  });





  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return InkWell(


      onTap: () {


        Navigator.push(


          context,


          MaterialPageRoute(


            builder: (_) =>
                const LanguageSelectionScreen(),


          ),


        );


      },


      borderRadius:
          BorderRadius.circular(18),





      child: Container(


        constraints: const BoxConstraints(

          maxWidth: 160,

        ),


        padding:
            const EdgeInsets.symmetric(

              horizontal: 12,

              vertical: 8,

            ),





        decoration: BoxDecoration(


          color:
              Colors.white,



          borderRadius:
              BorderRadius.circular(18),



          boxShadow: [


            BoxShadow(

              color:
                  Colors.black.withOpacity(.05),

              blurRadius:
                  10,

              offset:
                  const Offset(0,4),

            ),


          ],


        ),





        child: Row(


          mainAxisSize:
              MainAxisSize.min,



          children: [





            Container(


              height:
                  32,


              width:
                  32,



              decoration: const BoxDecoration(


                color:
                    Color(0xffF6F5F2),


                shape:
                    BoxShape.circle,


              ),



              child: const Icon(


                Icons.language_rounded,


                color:
                    Color(0xff165C34),


                size:
                    20,


              ),


            ),





            const SizedBox(width:8),






            Flexible(


              child: Column(


                crossAxisAlignment:
                    CrossAxisAlignment.start,



                children: [





                  Text(


                    l10n.languageChangeText,


                    maxLines:
                        1,


                    overflow:
                        TextOverflow.ellipsis,



                    style: const TextStyle(


                      fontSize:
                          13,


                      fontWeight:
                          FontWeight.w700,


                      color:
                          Color(0xff165C34),


                    ),


                  ),





                  Text(


                    l10n.languageChangeHinglish,



                    maxLines:
                        1,


                    overflow:
                        TextOverflow.ellipsis,



                    style: TextStyle(


                      fontSize:
                          10,


                      color:
                          Colors.grey.shade700,


                      fontWeight:
                          FontWeight.w600,


                    ),


                  ),





                ],


              ),


            ),




          ],


        ),


      ),


    );


  }

}