import 'package:flutter/material.dart';

void main() => runApp(const ZooApp());

class ZooApp extends StatelessWidget {
  const ZooApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),
      home: const ZooGridPage(),
    );
  }
}

class ZooGridPage extends StatelessWidget {
  const ZooGridPage({super.key});

  // Datos organizados para limpieza de código
  final List<Map<String, String>> zooData = const [
    {'name': 'Hipopótamo', 'type': 'Mamífero Semi-acuático', 'url': 'https://raw.githubusercontent.com/DominiqueVaquera/Imagenes/refs/heads/main/h.jpg'},
    {'name': 'Elefante', 'type': 'Gigante de la Sabana', 'url': 'https://raw.githubusercontent.com/DominiqueVaquera/Imagenes/refs/heads/main/elefante.webp'},
    {'name': 'Delfín', 'type': 'Inteligencia Marina', 'url': 'https://raw.githubusercontent.com/DominiqueVaquera/Imagenes/refs/heads/main/delfin.jfif'},
    {'name': 'Insectos', 'type': 'Micromundo Fascinante', 'url': 'https://raw.githubusercontent.com/DominiqueVaquera/Imagenes/refs/heads/main/insecto.jfif'},
    {'name': 'Reptiles', 'type': 'Sangre Fría', 'url': 'https://raw.githubusercontent.com/DominiqueVaquera/Imagenes/refs/heads/main/reptil.jfif'},
    {'name': 'Tigre', 'type': 'Depredador Ágil', 'url': 'https://raw.githubusercontent.com/DominiqueVaquera/Imagenes/refs/heads/main/t.jpg'},
    {'name': 'Jirafa', 'type': 'Cuello Infinito', 'url': 'https://raw.githubusercontent.com/DominiqueVaquera/Imagenes/refs/heads/main/j.jfif'},
    {'name': 'Flamingos', 'type': 'Acróbata del Ártico', 'url': 'https://raw.githubusercontent.com/DominiqueVaquera/Imagenes/refs/heads/main/f.jfif'},
    {'name': 'Aves', 'type': 'Libertad en el Aire', 'url': 'https://raw.githubusercontent.com/DominiqueVaquera/Imagenes/refs/heads/main/aves.jpg'},
    {'name': 'Flamingo', 'type': 'Elegancia Rosada', 'url': 'https://raw.githubusercontent.com/DominiqueVaquera/Imagenes/refs/heads/main/ff.jpg'},
    {'name': 'Venado', 'type': 'Espíritu del Bosque', 'url': 'https://raw.githubusercontent.com/DominiqueVaquera/Imagenes/refs/heads/main/v.jpg'},
    {'name': 'Cuidador', 'type': 'Héroe del Refugio', 'url': 'https://raw.githubusercontent.com/DominiqueVaquera/Imagenes/refs/heads/main/cuidador-zoo.jpg'},
    {'name': 'Cuidadores', 'type': 'Rayas Únicas', 'url': 'https://raw.githubusercontent.com/DominiqueVaquera/Imagenes/refs/heads/main/c1.jfif'},
    {'name': 'Cuidadores', 'type': 'Familia Equina', 'url': 'https://raw.githubusercontent.com/DominiqueVaquera/Imagenes/refs/heads/main/c2.jfif'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F0), // Fondo hueso suave
      appBar: AppBar(
        title: const Text('ZOO EXPLORER', 
          style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2, color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xFF1B5E20),
        elevation: 10,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        // 2 columnas, 7 filas implícitas por los 14 items
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.72, // Relación ideal para fotos + 3 líneas de texto
        ),
        itemCount: zooData.length,
        itemBuilder: (context, index) {
          return AnimalCard(
            name: zooData[index]['name']!,
            subtitle: zooData[index]['type']!,
            imageUrl: zooData[index]['url']!,
          );
        },
      ),
    );
  }
}

class AnimalCard extends StatelessWidget {
  final String name;
  final String subtitle;
  final String imageUrl;

  const AnimalCard({
    super.key, 
    required this.name, 
    required this.subtitle, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGEN CON DEGRADADO SUPERPUESTO
          Expanded(
            flex: 3,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.network(imageUrl, fit: BoxFit.cover),
                ),
                // Overlay decorativo sutil
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black.withOpacity(0.2)],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // CONTENIDO DE TEXTO (Las 3 filas solicitadas)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Fila 1: Título con estilo moderno
                Text(
                  name.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xFF2E7D32),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                // Fila 2: Subtítulo descriptivo
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade600,
                    fontStyle: FontStyle.italic
                  ),
                  maxLines: 1,
                ),
                const SizedBox(height: 6),
                // Fila 3: Estrellas de valoración
                Row(
                  children: List.generate(5, (index) => const Icon(
                    Icons.star_rounded, 
                    size: 16, 
                    color: Colors.orangeAccent
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
