import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/constants/app_colors.dart';
import 'package:flutter_litera/core/presentation/widgets/litera_loading.dart';
import 'package:flutter_litera/features/book/domain/entities/book_entity.dart';
import 'package:flutter_litera/features/book/presentation/bloc/genre/genre_cubit.dart';
import 'package:flutter_litera/features/book/presentation/bloc/search/search_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  Timer? _debounce;

  // State filter lokal
  String _selectedSort = 'newest';
  int? _selectedYear;
  String? _selectedGenre;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<SearchBloc>().add(const SearchEvent.fetchNextPage());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<SearchBloc>().add(SearchEvent.applyFilter(keyword: query));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: const BackButton(color: Colors.black),
        title: const Text("Cari Buku", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _searchController,
              autofocus: false,
              decoration: InputDecoration(
                hintText: "Judul, Penulis, atau ISBN...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: _onSearchChanged,
            ),
          ),

          const SizedBox(height: 12),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                ActionChip(
                  avatar: const Icon(Icons.sort, size: 16),
                  label: Text(_getSortLabel(_selectedSort)),
                  onPressed: () => _showSortBottomSheet(context),
                  backgroundColor: Colors.white,
                  side: BorderSide(
                    color: _selectedSort != 'newest'
                        ? AppColors.primary
                        : Colors.grey,
                  ),
                ),
                const SizedBox(width: 8),

                ActionChip(
                  avatar: const Icon(Icons.filter_list, size: 16),
                  label: Text(
                    (_selectedYear != null || _selectedGenre != null)
                        ? "Terfilter"
                        : "Filter",
                  ),
                  onPressed: () => _showFilterBottomSheet(context),
                  backgroundColor:
                      (_selectedYear != null || _selectedGenre != null)
                      ? AppColors.primary
                      : Colors.white,
                  side: BorderSide(
                    color: (_selectedYear != null || _selectedGenre != null)
                        ? AppColors.primary
                        : Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.status == SearchStatus.loading &&
                    state.books.isEmpty) {
                  return const Center(child: LiteraLoading(isOverlay: false));
                }

                return CustomScrollView(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.all(16),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.65,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return _buildBookItem(state.books[index]);
                        }, childCount: state.books.length),
                      ),
                    ),

                    if (!state.hasReachedMax)
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: const Center(
                            child: LiteraLoading(isOverlay: false),
                          ),
                        ),
                      ),

                    if (state.hasReachedMax)
                      const SliverToBoxAdapter(child: SizedBox(height: 20)),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookItem(BookEntity book) {
    return InkWell(
      onTap: () => context.pushNamed('book-detail', extra: book),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Colors.grey[200],
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: book.coverUrl,
                  fit: BoxFit.cover,
                  errorWidget: (_, __, ___) =>
                      const Icon(Icons.book, size: 40, color: Colors.grey),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            book.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Text(
            book.author,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  void _showSortBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Urutkan Berdasarkan",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  _buildSortOption("Terbaru", "newest"),
                  _buildSortOption("Terlama", "oldest"),
                  _buildSortOption("Judul (A-Z)", "titleAZ"),
                  _buildSortOption("Judul (Z-A)", "titleZA"),
                  _buildSortOption("Harga Terendah", "priceLowHigh"),
                  _buildSortOption("Harga Tertinggi", "priceHighLow"),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSortOption(String label, String value) {
    final isSelected = _selectedSort == value;
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          color: isSelected ? AppColors.primary : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: isSelected
          ? const Icon(Icons.check, color: AppColors.primary)
          : null,
      onTap: () {
        setState(() => _selectedSort = value);
        Navigator.pop(context);
        context.read<SearchBloc>().add(SearchEvent.applyFilter(sort: value));
      },
    );
  }

  void _showFilterBottomSheet(BuildContext parentContext) {
    final currentYear = DateTime.now().year;
    final List<int> years = List.generate(100, (index) => currentYear - index);

    int? tempYear = _selectedYear;
    String? tempGenre = _selectedGenre;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return BlocProvider.value(
          value: parentContext.read<GenreCubit>(),
          child: StatefulBuilder(
            builder: (context, setModalState) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(ctx).viewInsets.bottom,
                ),
                child: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Filter Pencarian",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 20),
                        DropdownButtonFormField<int>(
                          initialValue: tempYear,
                          decoration: const InputDecoration(
                            labelText: "Tahun Terbit",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.calendar_today),
                          ),
                          items: years.map((year) {
                            return DropdownMenuItem(
                              value: year,
                              child: Text(year.toString()),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setModalState(() => tempYear = val);
                          },
                        ),
                        const SizedBox(height: 16),
                        BlocBuilder<GenreCubit, GenreState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              loading: () => const Center(
                                child: LinearProgressIndicator(),
                              ),
                              error: (msg) => Text("Gagal: $msg"),
                              loaded: (genreList) {
                                if (tempGenre != null &&
                                    !genreList.contains(tempGenre)) {
                                  tempGenre = null;
                                }
                                return DropdownButtonFormField<String>(
                                  initialValue: tempGenre,
                                  decoration: const InputDecoration(
                                    labelText: "Genre",
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.category),
                                    hintText: "Pilih Genre",
                                  ),
                                  items: genreList.map((genre) {
                                    return DropdownMenuItem(
                                      value: genre,
                                      child: Text(genre),
                                    );
                                  }).toList(),
                                  onChanged: (val) {
                                    setModalState(() => tempGenre = val);
                                  },
                                );
                              },
                              orElse: () => const SizedBox(),
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedYear = null;
                                    _selectedGenre = null;
                                  });
                                  Navigator.pop(ctx);
                                  parentContext.read<SearchBloc>().add(
                                    const SearchEvent.applyFilter(
                                      year: null,
                                      genre: null,
                                    ),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(50),
                                  side: const BorderSide(color: Colors.grey),
                                ),
                                child: const Text(
                                  "Reset",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedYear = tempYear;
                                    _selectedGenre = tempGenre;
                                  });
                                  Navigator.pop(ctx);
                                  parentContext.read<SearchBloc>().add(
                                    SearchEvent.applyFilter(
                                      year: tempYear,
                                      genre: tempGenre,
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  minimumSize: const Size.fromHeight(50),
                                ),
                                child: const Text(
                                  "Terapkan",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  String _getSortLabel(String value) {
    switch (value) {
      case 'newest':
        return "Terbaru";
      case 'oldest':
        return "Terlama";
      case 'titleAZ':
        return "Judul A-Z";
      case 'titleZA':
        return "Judul Z-A";
      case 'priceLowHigh':
        return "Harga Terendah";
      case 'priceHighLow':
        return "Harga Tertinggi";
      default:
        return "Urutkan";
    }
  }
}
