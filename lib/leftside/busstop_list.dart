import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrobusnerede/bloc/currentstop/bloc/current_stop_bloc.dart';

import '../../constant/color.dart';
import '../constant/constant.dart';
import '../cubit/list_cubit.dart';
import '../models/busStop.dart';

class busstop_list extends StatelessWidget {
  late List<busStop> busStopList;
  busstop_list({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var a = (MediaQuery.of(context).size.height) - 220;

    context.read<ListCubit>().loadBusstopList();
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border(
              bottom:
                  BorderSide(width: Constant.borderSize, color: borderColor),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                "Duraklar",
                style: Constant.busStopFontStyle,
              ),
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder<ListCubit, List<busStop>>(
            builder: (context, state) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemExtent: a / 43,
                  itemCount: state.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BlocBuilder<CurrentStopBloc, CurrentStopState>(
                      builder: (context, busstopbloc) {
                        if (state is CurrentStopLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (busstopbloc is CurrentStopLoaded) {
                          try {
                            return Container(
                              decoration: BoxDecoration(
                                color: index == busstopbloc.busStop
                                    ? Colors.green
                                    : null,
                                border: Border(
                                  bottom: BorderSide(
                                      width: Constant.borderSize,
                                      color: borderColor),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 0, bottom: 0),
                                child: Text(
                                  state[index].name,
                                  style: Constant.busStopFontStyle,
                                ),
                              ),
                            );
                          } catch (e) {
                            return Text(e.toString());
                          }
                        } else {
                          return const Text("");
                        }
                      },
                    );
                  });
            },
          ),
        )
      ],
    );
  }
}
