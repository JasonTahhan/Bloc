import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../blocs/GuestBloc/guest_bloc.dart';
import '../../blocs/GuestBloc/guest_event.dart';
import '../../blocs/GuestBloc/guest_state.dart';

class ModalSheet {
  static openModalBottomSheet(BuildContext context) {
    final double appBarHeight = kToolbarHeight;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BlocBuilder<GuestBloc, GuestState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - appBarHeight - 55,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(8),
                    right: Radius.circular(8),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Who’s Coming?',
                          style: TextStyle(
                            fontFamily: 'MontserratMedium',
                            fontSize: 18,
                            color: Color(0xFF323E48),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<GuestBloc>().add(ClearAll());
                          },
                          child: const Text(
                            'Clear All',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'MontserratMedium',
                              color: Color(0xFF297BE6),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Adults',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'MontserratMedium',
                            color: Color(0xFF3C4955),
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<GuestBloc>()
                                    .add(DecrementAdult(state.adultNb));
                              },
                              child: SvgPicture.asset(
                                'assets/minus.svg',
                                color: Color(0xFF3C4955),
                                width: 20,
                              ),
                            ),
                            const SizedBox(width: 25),
                            Text(state.adultNb.toString()),
                            const SizedBox(width: 25),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<GuestBloc>()
                                    .add(IncrementAdult(state.adultNb));
                              },
                              child: SvgPicture.asset(
                                'assets/plus.svg',
                                color: Color(0xFF297BE6),
                                width: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Children',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'MontserratMedium',
                            color: Color(0xFF3C4955),
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<GuestBloc>()
                                    .add(DecrementChildren(state.childrenNb));
                              },
                              child: SvgPicture.asset(
                                'assets/minus.svg',
                                color: Color(0xFF3C4955),
                                width: 20,
                              ),
                            ),
                            SizedBox(width: 25),
                            Text(state.childrenNb.toString()),
                            SizedBox(width: 25),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<GuestBloc>()
                                    .add(IncrementChildren(state.childrenNb));
                              },
                              child: SvgPicture.asset(
                                'assets/plus.svg',
                                color: Color(0xFF297BE6),
                                width: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.childrenNb,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    'Child ${index + 1}',
                                    style: TextStyle(
                                      fontFamily: 'MontserratMedium',
                                      color: Color(0xFF3C4955),
                                    ),
                                  ),
                                ),
                              ),
                              DropdownButton<int>(
                                value: state.childList[index] == 0
                                    ? null
                                    : state.childList[index],
                                onChanged: (newAge) {
                                  context
                                      .read<GuestBloc>()
                                      .add(NewChildAge(newAge!, index));
                                },
                                items: List.generate(12, (age) {
                                  return DropdownMenuItem<int>(
                                    value: age + 1,
                                    child: Text('${age + 1}'),
                                  );
                                }),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFF8AE56),
                            minimumSize: Size(342, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Search',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'MontserratMedium',
                              color: Color(0xFF323E48),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
