import 'package:bgs_app/controllers/video_player.dart';
import 'package:bgs_app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportProvider extends ConsumerWidget {
  const ReportProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportIndex = ref.watch(reportProvider);
    print('report index: $reportIndex');
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyButtons.reportButton(
          buttonText: 'Hatalı çözüm yapıldı.',
          onPressed: () {
            ref.read(reportProvider.notifier).update((state) => 1);
          },
          isSelected: reportIndex != 1,
        ),
        MyButtons.reportButton(
          buttonText: 'Cevap anahtarı yanlış verilmiş.',
          onPressed: () {
            ref.read(reportProvider.notifier).update((state) => 2);
          },
          isSelected: reportIndex != 2,
        ),
        MyButtons.reportButton(
          buttonText: 'Video çözümü açılmıyor.',
          onPressed: () {
            ref.read(reportProvider.notifier).update((state) => 3);
          },
          isSelected: reportIndex != 3,
        ),
        MyButtons.reportButton(
          buttonText: 'Soru çözümünü ve anlatımını beğenmedim.',
          onPressed: () {
            ref.read(reportProvider.notifier).update((state) => 4);
          },
          isSelected: reportIndex != 4,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                    minimumSize: const Size(110, 40),
                    textStyle: Theme.of(context).textTheme.labelLarge,
                    backgroundColor: Colors.grey[400]),
                child: const Text(
                  'Vazgeç',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size(110, 40),
                  textStyle: Theme.of(context).textTheme.labelLarge,
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  'Gönder',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (reportIndex == 0) {
                    print('şimdi $reportIndex ');
                    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Uyarı'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
             const  Text('Hata nedenini seçmeniz gerekmektedir.'),
             const  SizedBox(height: 20), 
              TextButton(
                child: const Text('Tamam', style: TextStyle(color: Colors.black),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
                  } else {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        )
      ],
    );
  }
  
}
