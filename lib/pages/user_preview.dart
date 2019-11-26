import 'package:dating_app/pages/details_page.dart';
import 'package:dating_app/pages/user_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dating_app/bloc/bloc.dart';

class UserPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(FetchUser());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Almost Tinder'),
      ),
      body: Center(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if(state is UserError) {
              return const Text(
                    'Something is wrong. Check your internet connection. :-(',
                    style: TextStyle(color: Colors.red),
                    );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    if(state is UserLoading) Container(
                      height: 380.0,
                      child: Center(
                      child: const CircularProgressIndicator()),
                    ),
                    if(state is UserLoaded) Hero(
                      tag: 'avatar',
                      child: Image.network(
                        state.user.image,
                        fit: BoxFit.fill,
                        height: 300,
                        width: 300,
                      ),
                    ),
                    if(state is UserLoaded) Container(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      height: 80.0,
                      child: Text(
                        state.user.name,
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ),
                    if(state is UserLoaded) UserButtons(
                      onReload: () {
                        return BlocProvider.of<UserBloc>(context).add(FetchUser());
                      },
                      onNext: () {
                            Navigator.of(context).push<void>(
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailsPage(user: state.user),
                              ),
                            );
                          },
                    ),
                    if(state is UserLoading || state is UserEmpty) const UserButtons(
                      onReload: null,
                      onNext: null
                    ),

                  ]
                )  
              );
            }
            
          },
        )
      ),
    );
  }
}
