import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoTrimSlider extends StatefulWidget {
  final VideoPlayerController controller;
  final double startPosition;
  final double endPosition;
  final ValueChanged<RangeValues> onChanged;

  VideoTrimSlider({
    required this.controller,
    required this.startPosition,
    required this.endPosition,
    required this.onChanged,
  });

  @override
  _VideoTrimSliderState createState() => _VideoTrimSliderState();
}

class _VideoTrimSliderState extends State<VideoTrimSlider> {
  late double _startPosition;
  late double _endPosition;

  @override
  void initState() {
    super.initState();
    _startPosition = widget.startPosition;
    _endPosition = widget.endPosition;
  }

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      min: 0.0,
      max: 1.0,
      values: RangeValues(_startPosition, _endPosition),
      labels: RangeLabels(_startPosition.toString(), _endPosition.toString()),
      onChanged: (values) {
        setState(() {
          _startPosition = values.start;
          _endPosition = values.end;
        });
        widget.onChanged(values);
      },
      onChangeEnd: (values) {
        widget.controller.seekTo(Duration(
            seconds:
                (widget.controller.value.duration.inSeconds * _startPosition)
                    .toInt()));
        widget.controller.play();
      },
    );
  }
}
