import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../widgets/driver_rating_card.dart';
import '../widgets/promo_content_card.dart';
import '../widgets/product_card.dart';
import '../widgets/product_list.dart';
import '../widgets/wallet_card.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/small_discount_card.dart';
import '../widgets/main_service_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;
  double _scrollOffset = 0.0;
  int _currentNavIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    setState(() {
      _scrollOffset = offset;
      _isScrolled = offset > 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    // screen size
    final screenHeight = MediaQuery.of(context).size.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    
    // wallet card height 
    const walletCardHeight = 120.0; 
    
    // for adaptive sake
    final greenBackgroundHeight = screenHeight < 600 
        ? screenHeight * 0.4 
        : screenHeight < 800 
            ? screenHeight * 0.35  
            : screenHeight * 0.3;  
    
    // ensure minimum and maximum heights for the green background
    const minGreenHeight = 200.0;  
    const maxGreenHeight = 350.0;  
    final clampedGreenHeight = greenBackgroundHeight.clamp(minGreenHeight, maxGreenHeight);
    
    final adjustedBackgroundHeight = clampedGreenHeight - _scrollOffset.clamp(0.0, clampedGreenHeight);

    final walletCardTopPosition = clampedGreenHeight - (walletCardHeight * 0.4); 
    final adjustedWalletPosition = walletCardTopPosition - statusBarHeight - 56;
    const minPosition = 20.0;
    final walletMarginTop = adjustedWalletPosition > minPosition ? adjustedWalletPosition : minPosition;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: adjustedBackgroundHeight,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.lightGreen, 
                //add your image here, remove the comment tag below
                //image: DecorationImage(
                  //image: AssetImage('assets/<nama file>.jpg'),
                  //fit: BoxFit.cover,
                //),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  color: _isScrolled ? AppColors.white : Colors.transparent,
                  child: SearchBarWidget(
                    showShadow: false, 
                    showBorder: _isScrolled,
                    onProfileTap: () {
                      // kalo ga mager
                    },
                    onTap: () {
                      // kalo ga mager
                    },
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: walletMarginTop),
                        const WalletCard(
                          balance: 'Rp1.000.000',
                          coins: '50.000 coins',
                          notificationCount: 2,
                        ),
                        const SizedBox(height: 24),
                        const ServicesGrid(),
                        const SizedBox(height: 8),

                        // promo card
                        const SmallDiscountCard(
                          text: 'Diskon s.d. 10rb/transaksi. Yuk, langganan',
                        ),
                        
                        // rating card 
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Kasih rating dulu, yuk!',
                            style: AppTextStyles.subheading,
                          ),
                        ),
                        const RatingCard(),
                        const SizedBox(height: 20),
                        
                        // 1st promo card
                        const PromoContentCard(
                          title: 'Kabar gembira untuk kita semua. Cobain! 💙',
                          subtitle: 'Sekarang bisa pake GoPay Later buat langganan Gojek PLUS. Lebih praktis + auto pembaharuan tiap bulan, mulai dari 9rb-an!',
                          bannerColor: Color(0xFF7FFF00), 
                          imageHeight: 180,
                          //imagePath: 'assets/images/promo_gopay.png',
                        ),
                        
                        // product list with horizontal scrolling
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: ProductList(
                            title: 'PROMO TERMURAH',
                            subtitle: 'Diskon s.d. 40% seharian. Cepetan, GoMart!',
                            onSeeAllPressed: () {
                              // kalo ga mager
                            },
                            products: _getProductCards(),
                          ),
                        ),
                        
                        // 2nd promo card
                        const PromoContentCard(
                          title: 'Butuh belanja beras dadakan?',
                          subtitle: 'GoMart siap anter kebutuhan dapur dalam itungan menit. Klik 🛒 ⚡',
                          bannerColor: Color(0xFFFFAA33), // Orange
                          imageHeight: 180,
                          //imagePath: 'assets/<nama file>.png',
                        ),
                        
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                // bottom navigation bar
                BottomNavBar(
                  currentIndex: _currentNavIndex,
                  onTap: (index) {
                    setState(() {
                      _currentNavIndex = index;
                    });
                  },
                ),
              ],
            ),
          ),
          // search bar transition when scrolled
          if (_isScrolled)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                  bottom: 16,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(40),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const SearchBarWidget(
                  showShadow: false,
                  showBorder: true,
                ),
              ),
            ),
        ],
      ),
    );
  }

  // put your product cards here :D
  List<ProductCard> _getProductCards() {
    return [
      ProductCard(
        name: 'Le Minerale',
        description: 'Galon 15L',
        price: 'Rp14.900',
        backgroundColor: Colors.purple.withAlpha(77),
        discountBadge: '31%',
        dayBadge: 'SENIN',
        //imagePath: 'assets/<nama file>.png',
      ),
      ProductCard(
        name: 'Indomie Mi',
        description: 'Goreng 84g',
        price: 'Rp1.900',
        backgroundColor: Colors.blue.withAlpha(77),
        discountBadge: '39%',
        dayBadge: 'SELASA',
        //imagePath: 'assets/<nama file>.png',
      ),
      ProductCard(
        name: 'Ultra Milk',
        description: 'UHT 1L',
        price: 'Rp14.900',
        backgroundColor: Colors.cyan.withAlpha(77),
        //imagePath: 'assets/<nama file>.png',
      ),
      ProductCard(
        name: 'Beras Pulen',
        description: 'Premium 5kg',
        price: 'Rp69.900',
        backgroundColor: Colors.amber.withAlpha(77),
        discountBadge: '25%',
        dayBadge: 'KAMIS',
        //imagePath: 'assets/<nama file>.png',
      ),
      ProductCard(
        name: 'Aqua',
        description: 'Botol 500ml',
        price: 'Rp3.500',
        backgroundColor: Colors.teal.withAlpha(77),
        discountBadge: '10%',
        dayBadge: 'JUMAT',
        //imagePath: 'assets/<nama file>.png',
      ),
      ProductCard(
        name: 'Wafer Tango',
        description: 'Sachet 200g',
        price: 'Rp12.000',
        backgroundColor: Colors.pink.withAlpha(77),
        discountBadge: '20%',
        dayBadge: 'SABTU',
        //imagePath: 'assets/<nama file>.png',
      ),
      ProductCard(
        name: 'Kopi',
        description: 'Sachet 35g',
        price: 'Rp3.000',
        backgroundColor: Colors.cyan.withAlpha(77),
        //imagePath: 'assets/<nama file>.png',
      ),
    ];
  }
} 