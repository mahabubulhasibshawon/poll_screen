import 'package:flutter/material.dart';

import '../models/poll_option.dart';

class PollScreen extends StatefulWidget {
  const PollScreen({super.key});

  @override
  _PollScreenState createState() => _PollScreenState();
}

class _PollScreenState extends State<PollScreen> {
  final List<PollOption> pollOptions = [
    PollOption(
      text: 'খুবই ভালো',
      votes: 11,
      voters: ['A', 'B', 'C', 'D'],
    ),
    PollOption(text: 'ভালো', votes: 0),
    PollOption(text: 'মোটামুটি', votes: 0),
    PollOption(text: 'আরও ইমপ্রুভ করা দরকার', votes: 0),
    PollOption(text: 'মতামত নেই', votes: 0),
  ];

  int selectedIndex = 0;

  int getTotalVotes() {
    return pollOptions.fold(0, (sum, option) => sum + option.votes);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final int totalVotes = getTotalVotes();

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color(0xFFd7fcd1), borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'আমাদের হ্যান্ড-সাপোর্ট নিয়ে আপনাদের মতামত আশা করছি (১০ম ব্যাচ)।',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: height * .01,
            ),
            Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  size: height * .02,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: height * .01,
                ),
                const Text(
                  'Select one',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: pollOptions.length,
                itemBuilder: (context, index) {
                  final option = pollOptions[index];
                  double votePercentage =
                      totalVotes > 0 ? option.votes / totalVotes : 0;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        // leading: Radio<int>(
                        //   value: index,
                        //   groupValue: selectedIndex,
                        //   onChanged: (value) {
                        //     setState(() {
                        //       selectedIndex = value!;
                        //       pollOptions[selectedIndex].votes++;
                        //     });
                        //   },
                        // ),
                        leading: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                              pollOptions[selectedIndex].votes++;
                            });
                          },
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedIndex == index
                                  ? Colors.green
                                  : Colors.transparent,
                              border: Border.all(
                                color: selectedIndex == index
                                    ? Colors.green
                                    : Colors.grey,
                                width: 2,
                              ),
                            ),
                            child: selectedIndex == index
                                ? const Icon(Icons.check,
                                    color: Colors.white, size: 16)
                                : null,
                          ),
                        ),
                        title:
                            Text(option.text, style: const TextStyle(fontSize: 16)),
                        // trailing: Text(
                        //   option.votes.toString(),
                        //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        // ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Display profile avatars
                            ...option.voters.take(2).map((voter) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.grey[300],
                                  child:
                                  Image.network('https://cdn.pixabay.com/photo/2019/08/11/18/59/icon-4399701_1280.png'),
                                  // Replace with `NetworkImage` for real images
                                ),
                              );
                            }).toList(),
                            if (option.voters.length > 2)
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.grey[300],
                                  child: Text(
                                    '+${option.voters.length - 2}',
                                    style: const TextStyle(
                                        fontSize: 10, color: Colors.black),
                                  ),
                                ),
                              ),
                            const SizedBox(width: 8),
                            Text(
                              option.votes.toString(),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: height * .08, right: 16),
                        child: TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0, end: votePercentage),
                          duration: const Duration(milliseconds: 500),
                          builder: (context, value, child) {
                            return LinearProgressIndicator(
                              value: value,
                              minHeight: height * .02,
                              backgroundColor: Colors.grey[200],
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(height * .01),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: height * .01,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '12:48 PM',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            SizedBox(
              height: height * .01,
            ),
            const Divider(),
            SizedBox(
              height: height * .01,
            ),
            Center(
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View votes',
                      style: TextStyle(fontSize: 24, color: Colors.green),
                    )))
          ],
        ),
      ),
    );
  }
}
