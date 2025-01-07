String completeImageUrl(String? url) {
  if (url == null || url.isEmpty) {
    return '';
  }
  const baseUrl = 'https://phimimg.com/';
  if (url.startsWith('http')) {
    return url; // URL đã đầy đủ
  }
  return '$baseUrl$url'; // Bổ sung tiền tố
}
