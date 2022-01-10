import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cryptocoins_icons/cryptocoins_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_practice/original_design_reference.dart';
import 'package:google_fonts/google_fonts.dart';

class Asset {
  final Color color;
  final IconData icon;
  final String name;
  final String abbreviation;
  final double price;
  final double variation;

  const Asset({
    required this.color,
    required this.icon,
    required this.name,
    required this.abbreviation,
    required this.price,
    required this.variation,
  });
}

const bitcoin = Asset(
  icon: CryptoCoinIcons.BTC_alt,
  color: Colors.orange,
  name: 'Bitcoin',
  abbreviation: 'BTC',
  price: 40177,
  variation: 0.27,
);
const cardano = Asset(
  icon: CryptoCoinIcons.ADA_alt,
  color: Colors.blue,
  name: 'Cardano',
  abbreviation: 'ADA',
  price: 18804.40,
  variation: -4.18,
);
const ethereum = Asset(
  icon: CryptoCoinIcons.ETH_alt,
  color: Colors.black,
  name: 'Ethereum',
  abbreviation: 'ETH',
  price: 3854.14,
  variation: -2.16,
);
const dogecoin = Asset(
  icon: CryptoCoinIcons.DOGE_alt,
  color: Color(0xffc0a11a),
  name: 'Dogecoin',
  abbreviation: 'Doge',
  variation: 5.20,
  price: 29293.10,
);
const coins = [dogecoin, bitcoin, cardano, ethereum];

class CryptoWallet extends StatelessWidget {
  const CryptoWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: GoogleFonts.roboto(color: Colors.black87),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _AppBar(),
                SizedBox(height: 16),
                _Card(),
                SizedBox(height: 32),
                _MyAssetsList(),
                SizedBox(height: 32),
                _MarketsTrendList(),
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
          _CustomIconButton(
            icon: Icons.arrow_back,
            onPressed: () => Navigator.of(context).pop(),
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
          const OriginalDesignButton(
            url: 'https://dribbble.com/shots/17181645-Cryptofo-App-Interaction',
          ),
          const SizedBox(width: 16),
          const _CustomIconButton(icon: Icons.notifications_outlined),
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
                asset: bitcoin,
                quantityOwn: 0.5,
              ),
              SizedBox(width: 16),
              _AssetCard(
                asset: cardano,
                quantityOwn: 1,
              ),
              SizedBox(width: 16),
              _AssetCard(
                asset: ethereum,
                quantityOwn: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AssetCard extends StatelessWidget {
  final Asset asset;
  final double quantityOwn;

  const _AssetCard({
    Key? key,
    required this.asset,
    required this.quantityOwn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => _AssetPage(asset)),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: RadialGradient(
            colors: [
              asset.color.withAlpha(110),
              asset.color,
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
                  child: Icon(asset.icon, color: Colors.white),
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
              asset.name,
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
      ),
    );
  }

  String get _variationText {
    final variationStr = asset.variation.toStringAsFixed(2);
    if (asset.variation > 0) {
      return '+$variationStr%';
    }
    return '$variationStr%';
  }

  String get _priceText {
    final priceStr = asset.price.toStringAsFixed(2);
    return '\$$priceStr';
  }

  String get _quantityOwnText {
    return '$quantityOwn ${asset.abbreviation}';
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
          children: coins.map((assets) => _AssetListTile(assets)).toList(),
        ),
      ],
    );
  }
}

class _AssetListTile extends StatefulWidget {
  final Asset asset;

  const _AssetListTile(
    this.asset, {
    Key? key,
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
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => _AssetPage(widget.asset)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 50,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: widget.asset.color,
                  borderRadius: BorderRadius.circular(50),
                ),
                height: 50,
                width: 50,
                child: Icon(
                  widget.asset.icon,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.asset.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.asset.abbreviation,
                    style: const TextStyle(
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
                      id: widget.asset.name,
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
                    style: const TextStyle(
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
    final variationStr = widget.asset.variation.toStringAsFixed(2);
    if (widget.asset.variation > 0) {
      return '+$variationStr%';
    }
    return '$variationStr%';
  }

  String get _priceText {
    final priceStr = widget.asset.price.toStringAsFixed(2);
    return '\$$priceStr';
  }

  Color get _variationColor {
    return widget.asset.variation > 0 ? Colors.lightGreen : Colors.red;
  }
}

class _AssetPage extends StatefulWidget {
  final Asset asset;

  const _AssetPage(this.asset, {Key? key}) : super(key: key);

  @override
  State<_AssetPage> createState() => _AssetPageState();
}

class _AssetPageState extends State<_AssetPage> with TickerProviderStateMixin {
  late final _chartTabController = TabController(length: 6, vsync: this);
  late final _detailsTabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            _AssetPageAppBar(widget.asset),
            const SizedBox(height: 32),
            _AssetPageIcon(widget.asset),
            const SizedBox(height: 24),
            _AssetPageDetails(widget.asset),
            const SizedBox(height: 24),
            TabBar(
              controller: _chartTabController,
              labelColor: Colors.black87,
              unselectedLabelColor: Colors.black54,
              tabs: const [
                Tab(text: '24H'),
                Tab(text: '1W'),
                Tab(text: '1M'),
                Tab(text: '3M'),
                Tab(text: '1Y'),
                Tab(text: 'All'),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.33,
              child: TabBarView(
                controller: _chartTabController,
                children: [
                  _randomChart(24),
                  _randomChart(7),
                  _randomChart(30),
                  _randomChart(90),
                  _randomChart(365),
                  _randomChart(365 * 5),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: _detailsTabController,
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.black54,
                isScrollable: true,
                tabs: const [
                  Tab(text: 'News'),
                  Tab(text: 'Overview'),
                  Tab(text: 'Markets'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _detailsTabController,
                children: [
                  for (var i = 0; i < 3; i++) const Text('''
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                    ''')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _randomChart(double points) {
    final data = [];
    var lastPrice = widget.asset.price;
    data.add([points, lastPrice]);
    for (var i = points - 1; i > 0; i--) {
      final variation = Random().nextInt((widget.asset.price / 10).floor());
      if (variation % 2 == 0) {
        lastPrice -= variation;
      } else {
        lastPrice += variation;
      }
      data.add([i, lastPrice]);
    }
    return charts.LineChart(
      [
        charts.Series(
          id: widget.asset.name,
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          areaColorFn: (_, __) =>
              charts.MaterialPalette.blue.shadeDefault.lighter,
          domainFn: (data, _) => data[0],
          measureFn: (data, _) => data[1],
          data: data.reversed.toList(),
        ),
      ],
      defaultRenderer: charts.LineRendererConfig(includeArea: true),
    );
  }
}

class _AssetPageAppBar extends StatelessWidget {
  final Asset asset;

  const _AssetPageAppBar(this.asset, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          _CustomIconButton(
            icon: Icons.arrow_back,
            onPressed: () => Navigator.of(context).pop(),
          ),
          Expanded(
            child: Center(
              child: Text(
                '${asset.name} / ${asset.abbreviation}',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const _CustomIconButton(icon: Icons.favorite_border),
        ],
      ),
    );
  }
}

class _AssetPageIcon extends StatelessWidget {
  final Asset asset;

  const _AssetPageIcon(this.asset, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: asset.color,
      shadowColor: asset.color,
      elevation: 4,
      borderRadius: BorderRadius.circular(64),
      child: Container(
        decoration: BoxDecoration(
          color: asset.color,
          borderRadius: BorderRadius.circular(64),
        ),
        height: 64,
        width: 64,
        child: Center(
          child: Icon(asset.icon, color: Colors.white),
        ),
      ),
    );
  }
}

class _AssetPageDetails extends StatelessWidget {
  final Asset asset;

  const _AssetPageDetails(this.asset, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          _priceText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 36,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _absoluteVariationText,
              style: const TextStyle(color: Colors.black54),
            ),
            const SizedBox(width: 8),
            Text(
              _percentageVariationText,
              style: TextStyle(color: _variationColor),
            ),
            const SizedBox(width: 4),
            Icon(_variationIcon, color: _variationColor),
          ],
        ),
      ],
    );
  }

  String get _priceText {
    final priceStr = asset.price.toStringAsFixed(2);
    return '\$$priceStr';
  }

  String get _absoluteVariationText {
    final absoluteVariation = asset.price * asset.variation;
    final absoluteVariationStr = absoluteVariation.toStringAsFixed(2);
    return '\$$absoluteVariationStr';
  }

  String get _percentageVariationText {
    final percentageVariationStr = asset.variation.toStringAsFixed(2);
    if (asset.variation > 0) {
      return '+$percentageVariationStr%';
    }
    return '-$percentageVariationStr%';
  }

  Color get _variationColor {
    return asset.variation > 0 ? Colors.lightGreen : Colors.red;
  }

  IconData get _variationIcon {
    return asset.variation > 0 ? Icons.trending_up : Icons.trending_down;
  }
}

class _CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const _CustomIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          onTap: onPressed,
          child: Center(
            child: Icon(icon, size: 28),
          ),
        ),
      ),
    );
  }
}
