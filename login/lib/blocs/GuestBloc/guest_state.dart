
import 'package:equatable/equatable.dart';

class GuestState extends Equatable {
  final int adultNb;
  final int childrenNb;
  final List<int> childList;
  //final bool allChildrenAge;

  GuestState({
    required this.adultNb,
    required this.childrenNb,
    required this.childList,
    //required this.allChildrenAge,
  });

  GuestState copyWith({
    int? adultNb,
    int? childrenNb,
    List<int>? childList,
    //bool? allChildrenAge,
  }) {
    return GuestState(
      adultNb: adultNb ?? this.adultNb,
      childrenNb: childrenNb ?? this.childrenNb,
      childList: childList ?? this.childList,
      //allChildrenAge: allChildrenAge ?? this.allChildrenAge,
    );
  }

  @override
  List<Object?> get props => [adultNb, childrenNb, childList, 
 // allChildrenAge
  ];
}
