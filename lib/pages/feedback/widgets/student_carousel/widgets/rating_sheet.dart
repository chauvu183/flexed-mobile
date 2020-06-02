import 'package:flexed_mobile/api/repository/soltrack_repository.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/types/enums/rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    _selectedRating = this.tracking.rating != null ? this.tracking.rating : Rating.UNDEFINED;
  }

  _selectRating(Rating rating) {
    setState(() {
      _selectedRating = rating == _selectedRating ? Rating.UNDEFINED : rating;
    });
  }

  _submitRating() {
    tracking.rating = _selectedRating;

    _repo.update(tracking).then((tracking) => Navigator.pop(context, tracking.rating));
  }

  _buildRatingButton({Icon icon, Rating rating}) {
    return IconButton(
      icon: icon,
      color: _selectedRating == rating ? Theme.of(context).primaryColorLight : null,
      iconSize: 55,
      onPressed: () => _selectRating(rating),
    );
  }

  @override
  Widget build(BuildContext context) {
    _repo = Provider.of<SOLTrackRepository>(context);

    return Container(
      height: 215.0,
      color: Color(0xFF737373),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).accentColor,
          ]),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 18),
                    text: 'Bewertung für ', 
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
                      child: Text('Bestätigen', style: TextStyle(fontSize: 18.0, color: _selectedRating == this.tracking.rating ? Theme.of(context).primaryColor : Colors.black),),
                      color: Theme.of(context).primaryColorLight,
                      onPressed: _selectedRating == this.tracking.rating ? null : () => _submitRating(),
                    ),
                  ),
                ),
              )
            ]
          )
          
        ),
      ),
    );
  }

}
