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

// ============ SPLASH ============
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
      () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginPage())));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(Icons.shopping_bag, size: 90, color: Colors.blue),
      SizedBox(height: 15),
      Text("Polo_509 Market", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
    ])),
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
    appBar: AppBar(title: const Text("Koneksyon")),
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
    appBar: AppBar(title: const Text("Enskripsyon")),
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
    {"name": "Nike Air Force", "type": "👟", "price": "120", "img": "https://images.unsplash.com/photo-1549298916-b41d501d3772?w=400&h=400&fit=crop"},
    {"name": "Adidas Superstar", "type": "👟", "price": "100", "img": "https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?w=400&h=400&fit=crop"},
    {"name": "Maillot PSG", "type": "👕", "price": "85", "img": "https://thumblr.uniid.it/product/369617/6e9251292495.jpg?width=1920&format=webp&q=75"},
    {"name": "Jordan 4", "type": "👟", "price": "200", "img": "https://images.unsplash.com/photo-1551107696-a4b0c5a0d9a2?w=400&h=400&fit=crop"},
    {"name": "Maillot Brésil", "type": "👕", "price": "90", "img": "https://thumblr.uniid.it/product/256410/66a5780e3ab4.jpg?width=1920&format=webp&q=75"},
    {"name": "New Balance", "type": "👟", "price": "110", "img": "https://images.unsplash.com/photo-1539185441755-769473a23570?w=400&h=400&fit=crop"},
  ];

  // Fonction de déconnexion
  void _logout() {
    cart.clear(); 
    Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false 
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("🚪 Dekonekte!"), duration: Duration(seconds: 1))
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Street Wear"),
      actions: [
        IconButton(icon: const Icon(Icons.shopping_cart), 
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CartPage())).then((_) => setState(() {}))),
        // BOUTON DE DECONNEXION
        IconButton(
          icon: const Icon(Icons.logout, color: Colors.red),
          onPressed: _logout,
          tooltip: "Dekonekte",
        ),
      ],
    ),
    body: GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemCount: products.length,
      itemBuilder: (_, i) {
        final item = products[i];
        return Card(
          child: Column(children: [
            Expanded(flex: 3, child: Image.network(item["img"]!, fit: BoxFit.cover)),
            Expanded(
              child: Column(children: [
                Text(item["name"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text("${item["type"]} \$${item["price"]}"),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, minimumSize: const Size(100, 30)),
                  child: const Text("Achte", style: TextStyle(fontSize: 12)),
                  onPressed: () {
                    cart.add(item);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("➕ Ajoute!"), duration: Duration(seconds: 1)));
                  },
                )
              ]),
            )
          ]),
        );
      },
    ),
  );
}

// ============ CART ============
class CartPage extends StatefulWidget {
  const CartPage({super.key});
  @override
  State createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Fonction de déconnexion
  void _logout() {
    cart.clear(); // efase tout pwodwi
    Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false // pou m siprime istorik lan
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("🚪 Dekonekte!"), duration: Duration(seconds: 1))
    );
  }

  @override
  Widget build(BuildContext context) {
    final total = cart.fold(0, (s, i) => s + int.parse(i["price"]!));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panye"),
        actions: [
          if (cart.isNotEmpty) 
            IconButton(icon: const Icon(Icons.delete_sweep), 
              onPressed: () { cart.clear(); setState(() {}); }),
          // BOUTON DE DECONNEXION ICI
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.red),
            onPressed: _logout,
            tooltip: "Dekonekte",
          ),
        ],
      ),
      body: cart.isEmpty 
        ? const Center(child: Text("Panye vid 🛒"))
        : Column(children: [
            Expanded(
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (_, i) => Card(
                  child: ListTile(
                    leading: Image.network(cart[i]["img"]!, width: 50, height: 50, fit: BoxFit.cover),
                    title: Text(cart[i]["name"]!),
                    subtitle: Text("${cart[i]["type"]} \$${cart[i]["price"]}"),
                    trailing: IconButton(icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () { cart.removeAt(i); setState(() {}); }),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text("Total:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("\$$total", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue)),
              ]),
            )
          ]),
    );
  }
}
