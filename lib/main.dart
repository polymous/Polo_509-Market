import 'package:flutter/material.dart';

void main() => runApp(const AutoMarketApp());

class AutoMarketApp extends StatelessWidget {
  const AutoMarketApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Polo_509 Market',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.blue),
    home: const SplashScreen(),
  );
}

// ============ FAKE AUTH ============
class FakeAuth {
  static final users = {"admin@gmail.com": "12345678"};
  static bool login(String e, String p) => users[e] == p;
  static bool signup(String e, String p) {
    if (users.containsKey(e)) return false;
    users[e] = p;
    return true;
  }
}

// ============ CART SIMPLE ============
var cart = []; 

// ============ SPLASH Ak LOADING ============
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), 
      () {
        if (mounted) {
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(builder: (_) => const WelcomeScreen())
          );
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.8, end: 1.0),
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOutBack,
            builder: (context, scale, child) {
              return Transform.scale(
                scale: scale,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.shopping_bag, 
                    size: 80, 
                    color: Colors.blue.shade700,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 30),
          const Text(
            "Polo_509 Market",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(height: 15),
          const Text(
            "Rad orijinal epi resan pou tout moun!",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 40),
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            strokeWidth: 5,
          ),
          const SizedBox(height: 20),
          const Text(
            "Ap mache...",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}

// ============ WELCOME SCREEN ============
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue.shade50, Colors.white],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_bag, size: 100, color: Colors.blue.shade700),
              const SizedBox(height: 20),
              const Text(
                "Polo_509 Market",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              const SizedBox(height: 10),
              const Text(
                "Rad orijinal epi resan pou tout moun!",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 60),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.login, size: 24),
                  label: const Text("Konekte", style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage()));
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.list, size: 24),
                  label: const Text("Lis pwodwi", style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.person_add, size: 24),
                  label: const Text("Kreye kont", style: TextStyle(fontSize: 18)),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blue,
                    side: const BorderSide(color: Colors.blue, width: 2),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupPage()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

// ============ LOGIN ============
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final e = TextEditingController();
  final p = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Koneksyon"),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    ),
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextFormField(controller: e, decoration: const InputDecoration(labelText: "Imèl", border: OutlineInputBorder()),
            validator: (v) => v != null && v.contains('@') ? null : "Imèl pa bon"),
          const SizedBox(height: 16),
          TextFormField(controller: p, obscureText: true, decoration: const InputDecoration(labelText: "Modpas", border: OutlineInputBorder()),
            validator: (v) => v != null && v.length >= 8 ? null : "8 karaktè minimòm"),
          const SizedBox(height: 20),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {
            if (formKey.currentState!.validate() && FakeAuth.login(e.text.trim(), p.text)) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Imèl oswa modpas pa kòrèk")));
            }
          }, child: const Text("Login"))),
          TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupPage())), 
            child: const Text("Kreye kont")),
        ]),
      ),
    ),
  );
}

// ============ SIGNUP ============
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  State createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final e = TextEditingController();
  final p = TextEditingController();
  final c = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Enskripsyon"),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    ),
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextFormField(controller: e, decoration: const InputDecoration(labelText: "Imèl", border: OutlineInputBorder()),
            validator: (v) => v != null && v.contains('@') ? null : "Imèl pa bon"),
          const SizedBox(height: 16),
          TextFormField(controller: p, obscureText: true, decoration: const InputDecoration(labelText: "Modpas", border: OutlineInputBorder()),
            validator: (v) => v != null && v.length >= 8 ? null : "8 karaktè minimòm"),
          const SizedBox(height: 16),
          TextFormField(controller: c, obscureText: true, decoration: const InputDecoration(labelText: "Konfime", border: OutlineInputBorder()),
            validator: (v) => v == p.text ? null : "Modpas yo pa menm"),
          const SizedBox(height: 20),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {
            if (formKey.currentState!.validate() && FakeAuth.signup(e.text.trim(), p.text)) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Kont kreye!"), backgroundColor: Colors.green));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Imèl deja egziste")));
            }
          }, child: const Text("Enskri"))),
        ]),
      ),
    ),
  );
}

// ============ HOME ============
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final products = [
    {
      "id": "1",
      "name": "Nike Air Force 1", 
      "type": "👟", 
      "price": "120", 
      "detail": "Blan, kouran, confort",
      "description": "Sneaker klasik Nike Air Force 1. Koulè blan, an kouran, konfòtab pou tout jounen. Materyèl kwi ak semèl kawoutchou.",
      "img": "https://images.unsplash.com/photo-1549298916-b41d501d3772?w=400&h=400&fit=crop"
    },
    {
      "id": "2",
      "name": "Adidas Superstar", 
      "type": "👟", 
      "price": "100", 
      "detail": "Klasik, kok, nwa",
      "description": "Adidas Superstar ak kok an metal. Design ikonik depi ane 70. Konfòtab, stylish, adapte ak tout stil.",
      "img": "https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?w=400&h=400&fit=crop"
    },
    {
      "id": "3",
      "name": "Maillot PSG 2024", 
      "type": "👕", 
      "price": "85", 
      "detail": "2024, Dri-fit, ble",
      "description": "Maillot ofisyèl Paris Saint-Germain sezon 2024. Teknoloji Dri-fit, koulè ble ak wouj. Tifoy reyèl!",
      "img": "https://thumblr.uniid.it/product/369617/6e9251292495.jpg?width=1920&format=webp&q=75"
    },
    {
      "id": "4",
      "name": "Air Jordan 4 Retro", 
      "type": "👟", 
      "price": "200", 
      "detail": "Retro, blan, kawoutchou",
      "description": "Jordan 4 Retro blan ak nwa. Design siyati Michael Jordan. Semèl epè, an kawoutchou. Klasik absoli!",
      "img": "https://images.unsplash.com/photo-1551107696-a4b0c5a0d9a2?w=400&h=400&fit=crop"
    },
    {
      "id": "5",
      "name": "Maillot Brésil", 
      "type": "👕", 
      "price": "90", 
      "detail": "R9, jòn, vèt",
      "description": "Maillot tradisyonèl Brezil. Koulè jòn ak vèt. Style Ronaldo Nazário. 100% poliyestè.",
      "img": "https://thumblr.uniid.it/product/256410/66a5780e3ab4.jpg?width=1920&format=webp&q=75"
    },
    {
      "id": "6",
      "name": "New Balance 550", 
      "type": "👟", 
      "price": "110", 
      "detail": "550, gri, beige",
      "description": "New Balance 550, modèl retro basket. Koulè gri ak beige. Konfòtab, lejè, an vogue.",
      "img": "https://images.unsplash.com/photo-1539185441755-769473a23570?w=400&h=400&fit=crop"
    },
    {
      "id": "7",
      "name": "Maillot Argentine", 
      "type": "👕", 
      "price": "95", 
      "detail": "Messi, ble, blan",
      "description": "Maillot ofisyèl Argentine ak 3 etwal. Koulè ble ak blan. Design Lionel Messi. Edisyon spesyàl!",
      "img": "https://thumblr.uniid.it/product/431637/4313b78004f2.jpg?width=1920&format=webp&q=75"
    },
    {
      "id": "8",
      "name": "Converse Chuck Taylor", 
      "type": "👟", 
      "price": "80", 
      "detail": "High, nwa, tokay",
      "description": "Converse Chuck Taylor All Star High. Koulè nwa klasik. Tokay an twal, semèl kawoutchou. Endetrònable!",
      "img": "https://images.unsplash.com/photo-1607522370275-f14206abe5d3?w=400&h=400&fit=crop"
    },
  ];

  void _logout() {
    cart.clear(); 
    Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(builder: (_) => const WelcomeScreen()),
      (route) => false 
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("🚪 Dekonekte!"), duration: Duration(seconds: 1))
    );
  }

  void _goToCart() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const CartPage())).then((_) => setState(() {}));
  }

  void _goToDetails(Map<String, String> item) {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (_) => DetailPage(item: item)
      )
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Rad pou tout peyi a!"),
      actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.menu),
          onSelected: (value) {
            if (value == 'konekte') {
              _logout();
            } else if (value == 'lis') {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("📋 Ou sou lis pwodwi deja"), duration: Duration(seconds: 1))
              );
            } else if (value == 'dekonekte') {
              _logout();
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(value: 'konekte', child: Row(
              children: [Icon(Icons.login), SizedBox(width: 8), Text("Konekte")],
            )),
            PopupMenuItem(value: 'lis', child: Row(
              children: [Icon(Icons.list), SizedBox(width: 8), Text("Lis pwodwi")],
            )),
            PopupMenuItem(value: 'dekonekte', child: Row(
              children: [Icon(Icons.logout, color: Colors.red), SizedBox(width: 8), Text("Dekonekte", style: TextStyle(color: Colors.red))],
            )),
          ],
        ),
        IconButton(icon: const Icon(Icons.shopping_cart), onPressed: _goToCart),
      ],
    ),
    body: GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        childAspectRatio: 0.75, 
        crossAxisSpacing: 10, 
        mainAxisSpacing: 10
      ),
      itemCount: products.length,
      itemBuilder: (_, i) {
        final item = products[i];
        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(item["img"]!, fit: BoxFit.cover),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item["name"]!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 2),
                      Text(item["detail"]!, style: TextStyle(fontSize: 11, color: Colors.grey[600])),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${item["type"]} \$${item["price"]}", style: const TextStyle(fontWeight: FontWeight.w500)),
                          Row(
                            children: [
                              // 🔵 BOUTON DETAY
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(Icons.info_outline, size: 16, color: Colors.blue),
                                  onPressed: () => _goToDetails(item),
                                  tooltip: "Detay",
                                ),
                              ),
                              const SizedBox(width: 4),
                              // 🛒 BOUTON ACHTE
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue, 
                                  minimumSize: const Size(60, 28),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                ),
                                child: const Text("Achte", style: TextStyle(fontSize: 11)),
                                onPressed: () {
                                  cart.add(item);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("➕ Ajoute!"), duration: Duration(seconds: 1))
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    ),
  );
}

// ============ PAJ DETAY PWODWI ============
class DetailPage extends StatelessWidget {
  final Map<String, String> item;
  
  const DetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item["name"]!),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const CartPage()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gwo imaj
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.grey.shade100,
              child: Image.network(
                item["img"]!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(item["type"] == "👟" ? Icons.sports_baseball : Icons.sports_soccer, size: 60, color: Colors.grey),
                        const SizedBox(height: 10),
                        Text("Imaj pa disponib", style: TextStyle(color: Colors.grey.shade700)),
                      ],
                    ),
                  );
                },
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Non ak tip
                  Row(
                    children: [
                      Text(
                        item["type"]!,
                        style: const TextStyle(fontSize: 30),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          item["name"]!,
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 10),
                  
                  // Pri
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "\$${item["price"]}",
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Ti detay rapid
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.info, color: Colors.blue.shade700),
                        const SizedBox(width: 10),
                        Text(
                          item["detail"]!,
                          style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 25),
                  
                  // Deskripsyon konplè
                  const Text(
                    "DESKRIPSYON",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 5,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: Text(
                      item["description"]!,
                      style: const TextStyle(fontSize: 16, height: 1.5),
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Bouton achte
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.add_shopping_cart),
                      label: const Text("Ajoute nan panye", style: TextStyle(fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      onPressed: () {
                        cart.add(item);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("✅ Ajoute nan panye!"), 
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 1)
                          )
                        );
                        Navigator.pop(context); // Retounen nan HomePage
                      },
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============ CART ============
class CartPage extends StatefulWidget {
  const CartPage({super.key});
  @override
  State createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _logout() {
    cart.clear();
    Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(builder: (_) => const WelcomeScreen()),
      (route) => false
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("🚪 Dekonekte!"), duration: Duration(seconds: 1))
    );
  }

  void _goToHome() {
    Navigator.pop(context);
  }

  void _goToDetails(Map<String, String> item) {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (_) => DetailPage(item: item)
      )
    ).then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final total = cart.fold(0, (s, i) => s + int.parse(i["price"]!));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panye"),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu),
            onSelected: (value) {
              if (value == 'konekte') {
                _logout();
              } else if (value == 'lis') {
                _goToHome();
              } else if (value == 'dekonekte') {
                _logout();
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 'konekte', child: Row(
                children: [Icon(Icons.login), SizedBox(width: 8), Text("Konekte")],
              )),
              PopupMenuItem(value: 'lis', child: Row(
                children: [Icon(Icons.list), SizedBox(width: 8), Text("Lis pwodwi")],
              )),
              PopupMenuItem(value: 'dekonekte', child: Row(
                children: [Icon(Icons.logout, color: Colors.red), SizedBox(width: 8), Text("Dekonekte", style: TextStyle(color: Colors.red))],
              )),
            ],
          ),
          if (cart.isNotEmpty) 
            IconButton(icon: const Icon(Icons.delete_sweep), 
              onPressed: () { cart.clear(); setState(() {}); }),
        ],
      ),
      body: cart.isEmpty 
        ? const Center(child: Text("Panye vid 🛒"))
        : Column(children: [
            Expanded(
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (_, i) => Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(cart[i]["img"]!, width: 50, height: 50, fit: BoxFit.cover),
                    ),
                    title: Text(cart[i]["name"]!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cart[i]["detail"]!, style: TextStyle(fontSize: 11, color: Colors.grey[600])),
                        Text("${cart[i]["type"]} \$${cart[i]["price"]}"),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Bouton detay nan cart tou!
                        IconButton(
                          icon: const Icon(Icons.info_outline, color: Colors.blue, size: 22),
                          onPressed: () => _goToDetails(cart[i]),
                          tooltip: "Detay",
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () { 
                            cart.removeAt(i); 
                            setState(() {}); 
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("\$$total", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue)),
                ],
              ),
            )
          ]),
    );
  }
}
