import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/utils.dart';

import '../../models/pokemon.dart';
import '../../providers/bucket_provider.dart';

class BucketPage extends ConsumerWidget {
  const BucketPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(bucketProvider);
    final isLoading = ref.watch(isLoadingProductsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bucket'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : data.isEmpty
              ? const Center(child: Text('No Data Please Add Some Items'))
              : ListView.separated(
                  itemCount: data.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return BucketBody(
                      data[index],
                    );
                  },
                ).paddingOnly(top: 20),
    );
  }
}

class BucketBody extends StatefulWidget {
  const BucketBody(this.data, {super.key});
  final Pokemon data;

  @override
  State<BucketBody> createState() => _BucketBodyState();
}

class _BucketBodyState extends State<BucketBody> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(widget.data.getImageUrl),
      title: Text(widget.data.name ?? ''),
      trailing: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return IconButton(
            icon: const Icon(
              Icons.delete_forever_outlined,
            ),
            onPressed: () {
              setState(() {
                ref.watch(bucketProvider.notifier).removeBucket(widget.data);
              });
            },
          );
        },
      ),
    );
  }
}
