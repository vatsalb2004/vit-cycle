import 'package:cycle/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'login.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Initialize Razorpay
  RazorpayService razorpayService = RazorpayService();
  razorpayService.initializeRazorpay();

  runApp(MyApp(razorpayService: razorpayService));
}

class MyApp extends StatelessWidget {
  final RazorpayService razorpayService;

  const MyApp({Key? key, required this.razorpayService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyLogin(),
      getPages: [
        GetPage(name: '/register', page: () => const MyRegister()),
        GetPage(name: '/login', page: () => const MyLogin()),
      ],
      navigatorObservers: [GetObserver()],
    );
  }
}

class RazorpayService {
  final Razorpay _razorpay = Razorpay();

  void initializeRazorpay() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void dispose() {
    _razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Handle payment success
    print('Payment Successful: ${response.paymentId}');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Handle payment failure
    print('Payment Error: ${response.message}');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet usage
    print('External Wallet: ${response.walletName}');
  }
}
