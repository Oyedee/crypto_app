import 'package:crypto_app/app/models/coin_base_response.dart';
import 'package:crypto_app/app/notifiers/btc_notifier.dart';
import 'package:crypto_app/app/styles/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final btcStream = ref.watch(getBtcStream);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'BTC',
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            btcStream.when(
              data: (CoinbaseResponseModel stream) {
                return ListTile(
                  trailing: Text(
                    '\$${stream.price}',
                    style: GoogleFonts.roboto(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: CustomColors.primaryColor,
                    ),
                  ),
                  title: Text(
                    '${stream.productId}',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    'Last Updated: ${stream.time}',
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
              error: (error, stacktrace) {
                return Text(
                  'Error',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator.adaptive(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(CustomColors.primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 10),
            /* ethStream.when(
              data: (CoinbaseResponseModel stream) {
                return ListTile(
                  trailing: Text(
                    '\$${stream.price}',
                    style: GoogleFonts.roboto(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: CustomColors.primaryColor,
                    ),
                  ),
                  title: Text(
                    '${stream.productId}',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    'Last Updated: ${stream.time}',
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
              error: (error, stacktrace) {
                return Text(
                  'Error',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator.adaptive(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(CustomColors.primaryColor),
                ),
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
