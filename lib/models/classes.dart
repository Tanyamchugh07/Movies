class Movies {
  Movies({
    required this.image,
    required this.name,
    required this.type,
  });
  final String name;
  final String image;
  final List<String> type;
}

List<Movies> moviesList = [
  Movies(
      image:
          'https://w0.peakpx.com/wallpaper/10/936/HD-wallpaper-ash-ketchum-hero-pokemon-super-thumbnail.jpg',
      name: 'Pokemon',
      type: ['Anime', 'Action']),
  Movies(
      image:
          'https://i.pinimg.com/originals/45/7a/b7/457ab7aefea3747a9480b387aad58ec7.jpg',
      name: 'Batman',
      type: ['Action', 'Dark']),
  Movies(
      image:
          'https://i.pinimg.com/564x/1a/aa/0e/1aaa0e201593fe039e9280ac4d87480d.jpg',
      name: 'Spiderman',
      type: ['Anime', 'Sci-fi']),
  Movies(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTalRHx2kOw2tlvitvqjF1-YOgqu4_RE9XSxQ&s',
      name: 'Supermario',
      type: ['Anime', 'Game']),
  Movies(
      image: 'https://www.ytechb.com/wp-content/uploads/2021/07/BGMI-Wallpaper-Thumb-35.webp',
      name: 'Bgmi',
      type: ['Action', 'Game']),
];
