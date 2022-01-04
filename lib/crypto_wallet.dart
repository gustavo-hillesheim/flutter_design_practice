import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cryptocoins_icons/cryptocoins_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CryptoWallet extends StatelessWidget {
  const CryptoWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: GoogleFonts.roboto(color: Colors.black87),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _AppBar(),
                const SizedBox(height: 16),
                const _Card(),
                const SizedBox(height: 32),
                const _MyAssetsList(),
                const SizedBox(height: 32),
                const _MarketsTrendList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const CloseButton(
            color: Colors.black45,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back',
                style: GoogleFonts.roboto(
                  color: Colors.black45,
                  fontSize: 16,
                ),
              ),
              Text(
                'Ahmad Fauzi',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {},
                child: const Center(
                  child: Icon(
                    Icons.notifications_outlined,
                    size: 28,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: GoogleFonts.roboto(
        color: Colors.white,
        fontWeight: FontWeight.w300,
        fontSize: 18,
      ),
      child: PhysicalModel(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(24),
        elevation: 8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade700,
                    Colors.lightBlueAccent,
                    Colors.lightBlueAccent,
                    Colors.blue.shade700,
                  ],
                  transform: const GradientRotation(pi * 0.7),
                  stops: const [
                    0,
                    0.35,
                    0.55,
                    0.95,
                  ],
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text('Total Balance'),
                      const Spacer(),
                      DropdownButtonHideUnderline(
                        child: DropdownButton(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          onChanged: null,
                          icon: const Icon(
                            Icons.expand_more,
                            color: Colors.white,
                          ),
                          value: 'USD',
                          items: const [
                            DropdownMenuItem(
                              child: Text(
                                'USD',
                                style: TextStyle(color: Colors.white),
                              ),
                              value: 'USD',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        '4,129.20',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 48,
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        'USD',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Monthly Profit'),
                      SizedBox(height: 8),
                      Text(
                        '\$1,331.00',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    '+9,02%',
                    style: TextStyle(
                      color: Colors.lightGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.trending_up, color: Colors.lightGreen),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MyAssetsList extends StatelessWidget {
  const _MyAssetsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Text(
              'My Assets',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add, color: Colors.blue),
              splashRadius: 24,
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            children: const [
              _AssetCard(
                icon: CryptoCoinIcons.BTC_alt,
                color: Colors.orange,
                name: 'Bitcoin',
                abbreviation: 'BTC',
                price: 40177,
                quantityOwn: 0.5,
                variation: 0.27,
              ),
              SizedBox(width: 16),
              _AssetCard(
                icon: CryptoCoinIcons.ADA_alt,
                color: Colors.blue,
                name: 'Cardano',
                abbreviation: 'ADA',
                price: 18804.40,
                quantityOwn: 1,
                variation: -4.18,
              ),
              SizedBox(width: 16),
              _AssetCard(
                icon: CryptoCoinIcons.ETH_alt,
                color: Colors.black,
                name: 'Ethereum',
                abbreviation: 'ETH',
                price: 3854.14,
                quantityOwn: 1,
                variation: -2.16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AssetCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String name;
  final String abbreviation;
  final double variation;
  final double quantityOwn;
  final double price;

  const _AssetCard({
    Key? key,
    required this.icon,
    required this.color,
    required this.name,
    required this.abbreviation,
    required this.variation,
    required this.quantityOwn,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: RadialGradient(
          colors: [
            color.withAlpha(110),
            color,
          ],
          center: Alignment.topLeft,
          radius: 1.5,
        ),
      ),
      height: 300,
      width: 250,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(icon, color: Colors.white),
              ),
              const Spacer(),
              Text(
                _variationText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            _priceText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _quantityOwnText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  String get _variationText {
    final variationStr = variation.toStringAsFixed(2);
    if (variation > 0) {
      return '+$variationStr%';
    }
    return '$variationStr%';
  }

  String get _priceText {
    final priceStr = price.toStringAsFixed(2);
    return '\$$priceStr';
  }

  String get _quantityOwnText {
    return '$quantityOwn $abbreviation';
  }
}

class _MarketsTrendList extends StatelessWidget {
  const _MarketsTrendList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Markets Trend',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16),
        Column(
          children: const [
            _AssetListTile(
              icon: CryptoCoinIcons.DOGE_alt,
              name: 'Dogecoin',
              abbreviation: 'Doge',
              variation: 5.20,
              price: 29293.10,
              color: Color(0xffc0a11a),
            ),
            _AssetListTile(
              icon: CryptoCoinIcons.BTC_alt,
              name: 'Bitcoin',
              abbreviation: 'BTC',
              variation: 0.27,
              price: 40177,
              color: Colors.orange,
            ),
            _AssetListTile(
              icon: CryptoCoinIcons.ADA_alt,
              name: 'Cardano',
              abbreviation: 'ADA',
              variation: -4.18,
              price: 18804.40,
              color: Colors.blue,
            ),
            _AssetListTile(
              icon: CryptoCoinIcons.ETH_alt,
              name: 'Ethereum',
              abbreviation: 'ETH',
              variation: -2.16,
              price: 3854.14,
              color: Colors.black,
            ),
          ],
        ),
      ],
    );
  }
}

class _AssetListTile extends StatefulWidget {
  final IconData icon;
  final Color color;
  final String name;
  final String abbreviation;
  final double price;
  final double variation;

  const _AssetListTile({
    Key? key,
    required this.icon,
    required this.color,
    required this.name,
    required this.abbreviation,
    required this.price,
    required this.variation,
  }) : super(key: key);

  @override
  _AssetListTileState createState() => _AssetListTileState();
}

class _AssetListTileState extends State<_AssetListTile> {
  final priceVariation = [
    for (var i = 0; i < 25; i++) [i, Random().nextInt(100)],
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 50,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(50),
                ),
                height: 50,
                width: 50,
                child: Icon(
                  widget.icon,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.abbreviation,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: charts.LineChart(
                  [
                    charts.Series(
                      id: widget.name,
                      colorFn: (_, __) =>
                          charts.MaterialPalette.green.shadeDefault,
                      domainFn: (data, _) => data[0],
                      measureFn: (data, _) => data[1],
                      data: priceVariation,
                    ),
                  ],
                  defaultInteractions: false,
                  domainAxis: const charts.AxisSpec<num>(
                    renderSpec: charts.NoneRenderSpec(),
                  ),
                  primaryMeasureAxis: const charts.NumericAxisSpec(
                    renderSpec: charts.NoneRenderSpec(),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _priceText,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    _variationText,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: _variationColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String get _variationText {
    final variationStr = widget.variation.toStringAsFixed(2);
    if (widget.variation > 0) {
      return '+$variationStr%';
    }
    return '$variationStr%';
  }

  String get _priceText {
    final priceStr = widget.price.toStringAsFixed(2);
    return '\$$priceStr';
  }

  Color get _variationColor {
    return widget.variation > 0 ? Colors.lightGreen : Colors.red;
  }
}
