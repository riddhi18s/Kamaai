import 'package:flutter/material.dart';



class ContinueButton extends StatelessWidget {


  final String text;

  final String hinglishText;

  final VoidCallback onTap;



  const ContinueButton({


    super.key,


    required this.text,


    required this.hinglishText,


    required this.onTap,


  });







  @override
  Widget build(BuildContext context) {



    return InkWell(



      onTap: onTap,



      borderRadius:

          BorderRadius.circular(20),





      child: Container(



        width:

            double.infinity,



        padding:

            const EdgeInsets.symmetric(



              vertical:14,



              horizontal:20,



            ),






        decoration: BoxDecoration(



          color:

              const Color(0xff165C34),



          borderRadius:

              BorderRadius.circular(20),





          boxShadow: [



            BoxShadow(



              color:

                  Colors.black.withOpacity(.10),



              blurRadius:

                  12,



              offset:

                  const Offset(0,6),



            ),



          ],



        ),







        child: Row(



          mainAxisAlignment:

              MainAxisAlignment.center,





          children: [







            Column(



              mainAxisSize:

                  MainAxisSize.min,





              children: [






                Text(



                  text,



                  textAlign:

                      TextAlign.center,



                  style: const TextStyle(



                    color:

                        Colors.white,



                    fontSize:

                        17,



                    fontWeight:

                        FontWeight.w800,



                  ),



                ),






                const SizedBox(height:2),







                Text(



                  hinglishText,



                  textAlign:

                      TextAlign.center,



                  style: TextStyle(



                    color:

                        Colors.white.withOpacity(.9),



                    fontSize:

                        12,



                    fontWeight:

                        FontWeight.w600,



                  ),



                ),





              ],



            ),







            const SizedBox(width:10),








            const Icon(



              Icons.arrow_forward_rounded,



              color:

                  Colors.white,



              size:

                  22,



            ),





          ],



        ),



      ),



    );

  }


}