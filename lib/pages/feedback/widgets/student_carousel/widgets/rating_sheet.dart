import 'package:flexed_mobile/api/repository/soltrack_repository.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/types/enums/rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:developer' as developer;

import 'package:provider/provider.dart';

class RatingSheet extends StatefulWidget {

  final SOLTrack tracking;

  RatingSheet(this.tracking);

  @override
  State<StatefulWidget> createState() {
    return _RatingSheetState(tracking);
  }

}


class _RatingSheetState extends State<RatingSheet> {

  SOLTrackRepository _repo;

  SOLTrack tracking;

  Rating _selectedRating;

  _RatingSheetState(this.tracking) {
    _selectedRating = this.tracking.rating;
  }

  _selectRating(Rating rating) {
    setState(() {
      _selectedRating = rating;
    });
  }

  _submitRating() {
    tracking.rating = _selectedRating;

    _repo.update(tracking).then((tracking) => Navigator.pop(context, tracking.rating));
  }

  _buildRatingButton({Icon icon, Rating rating}) {
    return IconButton(
      icon: icon,
      color: _selectedRating == rating ? Theme.of(context).accentColor : null,
      iconSize: 50,
      onPressed: () => _selectRating(rating),
    );
  }

  @override
  Widget build(BuildContext context) {
    _repo = Provider.of<SOLTrackRepository>(context);

    return Container(
      height: 215.0,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text.rich(
                TextSpan(
                  style: TextStyle(fontSize: 18),
                  text: 'Bewertung abgeben für ', 
                  children: <TextSpan>[
                    TextSpan(
                      text: tracking.subject.title, 
                      style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                    TextSpan(
                      text: ':'
                    ),
                  ] 
                )
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildRatingButton(icon: Icon(Icons.sentiment_very_dissatisfied), rating: Rating.BAD),
                    _buildRatingButton(icon: Icon(Icons.sentiment_dissatisfied), rating: Rating.QUITEBAD),
                    _buildRatingButton(icon: Icon(Icons.sentiment_neutral), rating: Rating.AVERAGE),
                    _buildRatingButton(icon: Icon(Icons.sentiment_satisfied), rating: Rating.QUITEGOOD),
                    _buildRatingButton(icon: Icon(Icons.sentiment_very_satisfied), rating: Rating.GOOD),
                  ],
                ),
              ]
            ),

            Flexible(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: SizedBox.expand(
                  child: RaisedButton(
                    child: Text('Bestätigen', style: TextStyle(fontSize: 18.0, color: Colors.white),),
                    color: Theme.of(context).accentColor,
                    onPressed: _selectedRating == null ? null : () => _submitRating(),
                  ),
                ),
              ),
            )
          ]
        )
        
      ),
    );
  }

}
