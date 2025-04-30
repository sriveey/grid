enum PhotoSource {
  instagram,
  gallery,
}

class Photo {
  final String id; // could be Instagram media ID or a random UUID for gallery
  final String path; // URL for Instagram or local file path
  final PhotoSource source;

  Photo({
    required this.id,
    required this.path,
    required this.source,
  });

  /// Helpful factory for creating from Instagram JSON response (future use)
  factory Photo.fromInstagramJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      path: json['media_url'], // or thumbnail_url for videos
      source: PhotoSource.instagram,
    );
  }

  /// Optional helper for local gallery file
  factory Photo.fromGallery(String filePath) {
    return Photo(
      id: DateTime.now().millisecondsSinceEpoch.toString(), // simple unique ID
      path: filePath,
      source: PhotoSource.gallery,
    );
  }
}
