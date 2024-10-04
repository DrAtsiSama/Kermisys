class User {
  final String id;
  final String name;
  final String role; // élève, parent, teneur de stand, organisateur
  final int tokens;
  final List<String> childrenIds; // pour les parents

  User({this.id, this.name, this.role, this.tokens, this.childrenIds});
}
