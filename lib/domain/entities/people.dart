class Usuario {
  String nombre;
  int numeroDeCuenta;
  String url;

  Usuario(this.nombre, this.numeroDeCuenta, this.url);
}

List<Usuario> usuarios = [
  Usuario('Kurumi', 123456,
      'https://i.pinimg.com/736x/ec/a2/aa/eca2aac3d9e3a30086ab54beb021b5e4.jpg'),
  Usuario('Gilgamesh', 789012,
      'https://64.media.tumblr.com/8692b2a3b0acd6b37b75d416b89cf53c/42ae36348a0d0b3e-fc/s400x600/dafd7d45568dd5fa6607a9c1365f6f637e3b648c.jpg'),
  Usuario('Sukuna', 345678,
      'https://i.pinimg.com/736x/ab/02/8c/ab028c39a023ead7e4cf20cb2fec07a8.jpg'),
  Usuario('Kurumi1', 1234561,
      'https://i.pinimg.com/736x/ec/a2/aa/eca2aac3d9e3a30086ab54beb021b5e4.jpg'),
  Usuario('Gilgamesh1', 7890121,
      'https://64.media.tumblr.com/8692b2a3b0acd6b37b75d416b89cf53c/42ae36348a0d0b3e-fc/s400x600/dafd7d45568dd5fa6607a9c1365f6f637e3b648c.jpg'),
  Usuario('Sukuna1', 3456781,
      'https://i.pinimg.com/736x/ab/02/8c/ab028c39a023ead7e4cf20cb2fec07a8.jpg'),
];