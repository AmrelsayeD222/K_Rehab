import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:k_rehab/core/utils/app_validators.dart';
import 'package:k_rehab/core/widgets/k_loading_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';

class ExerciseVedioPlayer extends StatefulWidget {
  final String url;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;

  const ExerciseVedioPlayer({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
  });

  @override
  State<ExerciseVedioPlayer> createState() => ExerciseVedioPlayerState();
}

class ExerciseVedioPlayerState extends State<ExerciseVedioPlayer> {
  VideoPlayerController? _videoController;
  bool _isInitialized = false;
  bool _hasError = false;

  bool get _isLottie =>
      widget.url.toLowerCase().contains('.lottie') ||
      widget.url.toLowerCase().contains('.json');

  bool get _isVideo =>
      widget.url.toLowerCase().contains('.mp4') ||
      widget.url.toLowerCase().contains('.mov') ||
      widget.url.toLowerCase().contains('.m4v') ||
      widget.url.toLowerCase().contains('.3gp') ||
      widget.url.toLowerCase().contains('.mkv');

  @override
  void initState() {
    super.initState();
    if (_isVideo) {
      _initVideo();
    }
  }

  @override
  void didUpdateWidget(covariant ExerciseVedioPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.url != widget.url) {
      _disposeVideo();
      if (_isVideo) {
        _initVideo();
      }
    }
  }

  Future<void> _initVideo() async {
    _disposeVideo();
    if (!mounted) return;
    setState(() {
      _isInitialized = false;
      _hasError = false;
    });
    try {
      _videoController =
          VideoPlayerController.networkUrl(Uri.parse(widget.url));
      await _videoController!.initialize();
      _videoController!.setLooping(true);
      _videoController!.setVolume(0.0); // Mute to behave like a gif/animation
      _videoController!.play();
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _hasError = true;
        });
      }
    }
  }

  void _disposeVideo() {
    _videoController?.pause();
    _videoController?.dispose();
    _videoController = null;
  }

  @override
  void dispose() {
    _disposeVideo();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!AppValidators.isValidImageUrl(widget.url)) {
      return widget.errorWidget ??
          const Icon(Icons.broken_image, size: 48, color: Colors.grey);
    }

    if (_isLottie) {
      return Lottie.network(
        widget.url,
        fit: widget.fit,
        frameBuilder: (context, child, composition) {
          if (composition == null) {
            return widget.placeholder ?? const KLoadingWidget();
          }
          return child;
        },
        errorBuilder: (context, error, stackTrace) =>
            widget.errorWidget ??
            const Icon(Icons.broken_image, size: 48, color: Colors.grey),
      );
    }

    if (_isVideo) {
      if (_hasError) {
        return widget.errorWidget ??
            const Icon(Icons.broken_image, size: 48, color: Colors.grey);
      }
      if (!_isInitialized) {
        return widget.placeholder ?? const KLoadingWidget();
      }
      return SizedBox.expand(
        child: FittedBox(
          fit: widget.fit,
          child: SizedBox(
            width: _videoController!.value.size.width,
            height: _videoController!.value.size.height,
            child: VideoPlayer(_videoController!),
          ),
        ),
      );
    }

    return CachedNetworkImage(
      imageUrl: widget.url,
      fit: widget.fit,
      placeholder: (context, url) =>
          widget.placeholder ?? const KLoadingWidget(),
      errorWidget: (context, url, error) =>
          widget.errorWidget ??
          const Icon(Icons.broken_image, size: 48, color: Colors.grey),
    );
  }
}
