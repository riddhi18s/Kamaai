import 'package:flutter/material.dart';

import '../../domain/auth_text_model.dart';



class PhoneInputCard extends StatefulWidget {


  final AuthTextModel texts;

  final Function(String phone) onPhoneChanged;



  const PhoneInputCard({


    super.key,


    required this.texts,


    required this.onPhoneChanged,


  });





  @override
  State<PhoneInputCard> createState() =>
      _PhoneInputCardState();

}





class _PhoneInputCardState
    extends State<PhoneInputCard> {



  final TextEditingController _controller =
      TextEditingController();





  @override
  void dispose() {


    _controller.dispose();


    super.dispose();


  }







  @override
  Widget build(BuildContext context) {


    return Container(


      width:
          double.infinity,


      padding:
          const EdgeInsets.all(22),





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






          Container(


            height:
                55,


            width:
                55,



            decoration: const BoxDecoration(


              color:
                  Color(0xffF6F5F2),


              shape:
                  BoxShape.circle,


            ),





            child: const Icon(


              Icons.phone_android_rounded,


              color:
                  Color(0xff165C34),


              size:
                  30,


            ),



          ),







          const SizedBox(height:16),







          Text(


            widget.texts.phoneTitle,


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







          const SizedBox(height:5),







          Text(


            widget.texts.phoneHinglish,


            textAlign:
                TextAlign.center,



            style: const TextStyle(


              fontSize:
                  14,


              fontWeight:
                  FontWeight.w600,


              color:
                  Colors.grey,


            ),



          ),







          const SizedBox(height:20),







          TextField(


            controller:
                _controller,



            keyboardType:
                TextInputType.phone,



            maxLength:
                10,



            onChanged: (value) {


              widget.onPhoneChanged(value);


            },



            decoration: InputDecoration(



              counterText:
                  "",




              prefixText:
                  "+91  ",



              prefixStyle: const TextStyle(



                fontWeight:
                    FontWeight.w700,



                color:
                    Color(0xff165C34),



              ),







              hintText:
                  widget.texts.phoneHint,






              filled:
                  true,



              fillColor:
                  const Color(0xffF6F5F2),






              border:
                  OutlineInputBorder(



                borderRadius:
                    BorderRadius.circular(16),



                borderSide:
                    BorderSide.none,



              ),



            ),



          ),





        ],



      ),


    );


  }


}