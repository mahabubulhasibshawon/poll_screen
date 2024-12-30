class PollOption {
  final String text;
  int votes;
  final List<String> voters; // List of image URLs or initials for voters.

  PollOption({required this.text, this.votes = 0, this.voters = const []});
}