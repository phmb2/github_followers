class User {
  final String login;
  final String avatarUrl;
  final String? name;
  final String? location;
  final String? bio;
  final int? publicRepos;
  final int? publicGists;
  final String htmlUrl;
  final int following;
  final int followers;
  final String createdAt;

  User(
      {
        required this.login,
        required this.avatarUrl,
        this.name,
        this.location,
        this.bio,
        this.publicRepos,
        this.publicGists,
        required this.htmlUrl,
        required this.following,
        required this.followers,
        required this.createdAt
      }
  );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      login: json['login'], avatarUrl: json['avatar_url'], name: json['name'], location: json['location'], bio: json['bio'],
      publicRepos: json['public_repos'], publicGists: json['public_gists'], htmlUrl: json['html_url'], following: json['following'],
      followers: json['followers'], createdAt: json['created_at']
    );
  }

}