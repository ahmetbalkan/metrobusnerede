import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrobusnerede/bloc/left_list/left_list_bloc.dart';
import 'package:metrobusnerede/constant/constant.dart';
import '../constant/color.dart';
import '../cubit/list_cubit.dart';
import '../cubit/way_counter_bloc/way_counter_bloc_cubit.dart';
import '../models/bus_stop.dart';

class busstop_list extends StatelessWidget {
  late List<busStop> busStopList;
  busstop_list({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var a = (MediaQuery.of(context).size.height) - 220;
    int way = context.watch<WayCounterBlocCubit>().state.way;

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
                    return Container(
                      decoration: BoxDecoration(
                        color: index ==
                                context.watch<LeftListBloc>().state.nextStop
                            ? Colors.green
                            : index ==
                                    wayMethod(
                                        way,
                                        context
                                            .watch<LeftListBloc>()
                                            .state
                                            .nextStop)
                                ? Colors.orange.shade600
                                : null,
                        border: Border(
                          bottom: BorderSide(
                              width: Constant.borderSize, color: borderColor),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 0),
                        child: Text(
                          state[index].name,
                          style: Constant.busStopFontStyle,
                        ),
                      ),
                    );
                  });
            },
          ),
        )
      ],
    );
  }

  int? wayMethod(int way, int currentstate) {
    if (way == 1) {
      return currentstate = currentstate - 1;
    } else if (way == 0) {
      return currentstate = currentstate + 1;
    }
  }
}
