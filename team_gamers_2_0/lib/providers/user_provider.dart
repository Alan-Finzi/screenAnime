import 'package:flutter/foundation.dart';

class UserVotesProvider with ChangeNotifier {

    int _availableVotes = 0;
    int _eventVotes = 0;
    int get availableVotes =>
        _availableVotes;
    int get eventVotes =>
        _eventVotes;

    set availableVotes(int availableVotes) {
        _availableVotes = availableVotes;
        notifyListeners();
    }

    set eventVotes(int eventVotes) {
        _eventVotes = eventVotes;
        notifyListeners();
    }
}