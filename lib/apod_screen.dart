import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../cubit/nasa_cubit.dart';

class ApodScreen extends StatelessWidget {
  const ApodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Юдин Данила ВМК-22 Вар 8')),
      
      body: BlocBuilder<ApodCubit, ApodState>(
        builder: (context, state) {
          if (state is ApodLoading) return buildLoading();
          if (state is ApodError) return buildError(state.message);
          if (state is ApodLoaded) return buildImageList(state.imageUrls);
          return const Center(child: Text('Initial state'));
        },
      ),
    );
  }

  Widget buildLoading() => const Center(child: CircularProgressIndicator());

  Widget buildError(String msg) => Center(child: Text(msg));

  Widget buildImageList(List<String> urls) {
    return ListView.builder(
      itemCount: urls.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CachedNetworkImage(
            imageUrl: urls[index],
            placeholder: (_, __) => Container(
              height: 200,
              color: Colors.grey[300],
              child: const Center(child: CircularProgressIndicator()),
            ),
            errorWidget: (_, __, ___) => Container(
              height: 200,
              color: Colors.grey[300],
              child: const Icon(Icons.error)),
            fit: BoxFit.cover,
            height: 200,
          ),
        );
      },
    );
  }
}