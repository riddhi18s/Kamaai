import 'package:flutter/material.dart';

class OtpVerificationCard extends StatefulWidget {
  final VoidCallback onVerified;

  const OtpVerificationCard({
    super.key,
    required this.onVerified,
  });

  @override
  State<OtpVerificationCard> createState() =>
      _OtpVerificationCardState();
}

class _OtpVerificationCardState
    extends State<OtpVerificationCard> {

  final TextEditingController otpController =
      TextEditingController();

  bool verifying = false;

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  Future<void> verifyOtp() async {

    if (otpController.text.trim().length != 6) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Enter a valid 6-digit OTP",
          ),
        ),
      );

      return;
    }

    setState(() {
      verifying = true;
    });

    await Future.delayed(
      const Duration(seconds: 1),
    );

    setState(() {
      verifying = false;
    });

    widget.onVerified();
  }

  @override
  Widget build(BuildContext context) {

    return Card(

      elevation: 2,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      child: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(

              "OTP Verification",

              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),

            ),

            const SizedBox(height: 15),

            Row(

              children: [

                Expanded(

                  child: TextField(

                    controller: otpController,

                    keyboardType:
                        TextInputType.number,

                    maxLength: 6,

                    decoration: const InputDecoration(

                      hintText: "Enter OTP",

                      counterText: "",

                      border: OutlineInputBorder(),

                    ),

                  ),

                ),

                const SizedBox(width: 10),

                SizedBox(

                  height: 56,

                  child: ElevatedButton(

                    onPressed:
                        verifying ? null : verifyOtp,

                    child: verifying
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child:
                                CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            "Verify",
                          ),

                  ),

                ),

              ],

            ),

          ],

        ),

      ),

    );

  }

}