import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/constants/app_colors.dart';
import 'package:flutter_litera/core/utils/app_snackbar.dart';
import 'package:flutter_litera/features/book/domain/entities/book_entity.dart';
import 'package:flutter_litera/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_litera/injection_container.dart';
import 'package:intl/intl.dart';

class NewBookSection extends StatelessWidget {
  const NewBookSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Formatter Rupiah
    final currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<HomeBloc>()..add(HomeEvent.fetchHomeBooks()),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ==========================================
          // 1. HEADER SECTION
          // ==========================================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Buku Terbaru',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMain,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    AppSnackbar.showInfo(context, "Testing.");
                    // Navigasi ke Search Page (View All)
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (_) => const SearchPage()),
                    // );
                  },
                  child: const Text(
                    "Lihat Semua",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 5),

          // ==========================================
          // 2. BOOK LIST SECTION
          // ==========================================
          SizedBox(
            height: 275,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),

                  error: (message) => Center(child: Text(message)),

                  loaded: (books) {
                    if (books.isEmpty) {
                      return const Center(child: Text("Belum ada buku."));
                    }

                    final displayBooks = books.take(5).toList();
                    final itemCount = displayBooks.length + 1;

                    return ListView.separated(
                      padding: const EdgeInsets.all(20),
                      scrollDirection: Axis.horizontal,
                      itemCount: itemCount,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 16),
                      itemBuilder: (context, index) {
                        if (index == displayBooks.length) {
                          return _buildViewAllCard(context);
                        }

                        final book = displayBooks[index];
                        return _buildBookCard(context, book, currencyFormat);
                      },
                    );
                  },

                  // 4. STATE LAINNYA (Initial, dll)
                  orElse: () => const SizedBox(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // WIDGET HELPER (Biar kodingan utama rapi)
  // ==========================================

  Widget _buildBookCard(
    BuildContext context,
    BookEntity book,
    NumberFormat fmt,
  ) {
    double rentalPrice = 5000;

    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => DetailBookPage(book: book),
        //   ),
        // );
      },
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Cover
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Hero(
                  tag: book.id,
                  child: CachedNetworkImage(
                    imageUrl: book.coverUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Container(color: Colors.grey[200]),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.broken_image),
                  ),
                ),
              ),
            ),

            // Info Buku & Harga
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    book.author,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textGrey,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    fmt.format(book.price),
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.textGrey,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: AppColors.textGrey,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.success.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      "Sewa ${fmt.format(rentalPrice)}/hari",
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: AppColors.success,
                      ),
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

  Widget _buildViewAllCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (_) => const SearchPage()),
        // );
        AppSnackbar.showInfo(context, "Testing.");
      },
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_forward_rounded,
                color: AppColors.primary,
                size: 32,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Lihat Semua",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
