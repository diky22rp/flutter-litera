import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/constants/app_colors.dart';
import 'package:flutter_litera/core/utils/app_snackbar.dart';
import 'package:flutter_litera/features/book/domain/entities/book_entity.dart';
import 'package:flutter_litera/features/hub/presentation/bloc/hub_bloc.dart';
import 'package:flutter_litera/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter_litera/features/transaction/presentation/bloc/booking_bloc.dart';
import 'package:flutter_litera/injection.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class RentalOrderPage extends StatefulWidget {
  final BookEntity book;

  const RentalOrderPage({super.key, required this.book});

  @override
  State<RentalOrderPage> createState() => _RentalOrderPageState();
}

class _RentalOrderPageState extends State<RentalOrderPage> {
  int _duration = 3;

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<BookingBloc>()),
        BlocProvider(create: (context) => sl<SettingsCubit>()..loadSettings()),
      ],
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: const Text(
            "Konfirmasi Sewa",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),

        body: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, settingsState) {
            double currentPrice = 5000;

            settingsState.maybeWhen(
              loaded: (settings) {
                currentPrice = settings.rentalPricePerDay.toDouble();
              },
              orElse: () {},
            );

            double subtotal = currentPrice * _duration;
            double grandTotal = subtotal;

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBookInfoCard(currencyFormat, currentPrice),

                        const SizedBox(height: 20),

                        _buildDurationSlider(),

                        const SizedBox(height: 20),

                        const Text(
                          "Lokasi Pengambilan",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        _buildLocationCard(),

                        const SizedBox(height: 20),

                        const Text(
                          "Rincian Pembayaran",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              _buildSummaryRow(
                                "Sewa ($_duration hari)",
                                subtotal,
                                currencyFormat,
                              ),
                              const Divider(height: 24),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Total",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    currencyFormat.format(grandTotal),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                _buildBottomBar(
                  context,
                  grandTotal,
                  currencyFormat,
                  settingsState,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildBottomBar(
    BuildContext context,
    double grandTotal,
    NumberFormat fmt,
    SettingsState settingsState,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: BlocConsumer<BookingBloc, BookingState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (code) {
              context.goNamed('booking-success', extra: code);
            },
            error: (msg) => AppSnackbar.showError(context, msg),
            orElse: () {},
          );
        },
        builder: (context, state) {
          final isBookingLoading = state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          );

          final isSettingsLoading = settingsState.maybeWhen(
            loading: () => true,
            orElse: () => false,
          );

          final bool isButtonDisabled = isBookingLoading || isSettingsLoading;

          return SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: isButtonDisabled
                  ? null
                  : () {
                      final hubState = context.read<HubBloc>().state;
                      String currentHubName = "Lokasi Litera";

                      hubState.whenOrNull(
                        hubNameLoaded: (name) => currentHubName = name,
                      );

                      context.read<BookingBloc>().add(
                        BookingEvent.rentBook(
                          book: widget.book,
                          durationInDays: _duration,
                          totalPrice: grandTotal,
                          paymentMethod: "CASH",
                          hubName: currentHubName,
                        ),
                      );
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: isButtonDisabled
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          fmt.format(grandTotal),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "Sewa Sekarang >",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDurationSlider() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Durasi Sewa",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "$_duration Hari",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Slider(
            value: _duration.toDouble(),
            min: 1,
            max: 7,
            divisions: 6,
            activeColor: AppColors.primary,
            label: "$_duration Hari",
            onChanged: (val) {
              setState(() => _duration = val.toInt());
            },
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "1 Hari",
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
              Text(
                "7 Hari",
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBookInfoCard(NumberFormat fmt, double pricePerDay) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: widget.book.coverUrl,
              width: 60,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    "Novel",
                    style: TextStyle(fontSize: 10, color: AppColors.primary),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.book.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.book.author,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  "${fmt.format(pricePerDay)} / hari",
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.success,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationCard() {
    return BlocBuilder<HubBloc, HubState>(
      builder: (context, state) {
        final hubName = state.maybeWhen(
          hubNameLoaded: (name) => name,
          orElse: () => "Lokasi belum dipilih",
        );

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.store, color: AppColors.primary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hubName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Ambil di toko (Pickup)",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSummaryRow(String label, double value, NumberFormat fmt) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: AppColors.textGrey)),
        Text(fmt.format(value)),
      ],
    );
  }
}
