import 'package:e_commerce/auth/domain/entity/auth_entity.dart';
import 'package:e_commerce/auth/domain/usecase/login_usecase.dart';
import 'package:e_commerce/auth/domain/usecase/profile_usecase.dart';
import 'package:e_commerce/auth/domain/usecase/register_usecase.dart';
import 'package:e_commerce/auth/presentation/state/auth_state.dart';
import 'package:e_commerce/core/router/app_route.dart';
import 'package:e_commerce/core/sharedPref/user_shared_pref.dart';
import 'package:e_commerce/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
    (ref) => AuthViewModel(ref.read(signUpUseCaseProvider),
        ref.read(loginUseCaseProvider), ref.read(profileUseCaseProvider)));

// final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
//     (ref) => AuthViewModel(ref.read(signUpUseCaseProvider),));

class AuthViewModel extends StateNotifier<AuthState> {
  final SignUpUseCase signUpUseCase;
  final LoginUseCase loginUseCase;
  final ProfileUseCase profileUseCase;
  AuthViewModel(this.signUpUseCase, this.loginUseCase, this.profileUseCase)
      : super(AuthState.initial());

  Future<void> signUpFreelancer(
      AuthEntity authEntity, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final result = await signUpUseCase.register(authEntity);
    state = state.copyWith(isLoading: false);
    result.fold(
      (failure) {
        state = state.copyWith(
          error: failure.error,
          showMessage: true,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green, // Background color of the snackbar
            content: Text(
              failure.error, // Display the error message from the backend
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16), // Text color
            ),
            duration: Duration(seconds: 3), // Duration to display the snackbar
            behavior: SnackBarBehavior
                .floating, // Make the snackbar float above the bottom navigation bar
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10)), // Rounded corners
            ),
          ),
        );
      },
      (success) {
        state = state.copyWith(
          isLoading: false,
          showMessage: true,
          error: null,
        );
        // getUser(context, email);
        // Navigator.popAndPushNamed(context, AppRoute.loginviewRoute);
      },
    );
    resetMessage();
  }

  Future<void> login(
      BuildContext context, String email, String password) async {
    state = state.copyWith(isLoading: true);
    final result = await loginUseCase.login(email, password);
    state = state.copyWith(isLoading: false);
    result.fold(
      (failure) {
        state = state.copyWith(
          error: failure.error,
          showMessage: true,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              failure.error,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            duration: Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
          ),
        );
      },
      (success) {
        state = state.copyWith(
          isLoading: false,
          showMessage: true,
          error: null,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green, // Change color as per your design
            content: Text(
              "Successfully Logged in",
              style: TextStyle(color: Colors.white),
            ),
            duration: Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
          ),
        );

        getUser(context, email);
        Navigator.popAndPushNamed(context, AppRoute.homeView);
      },
    );
  }

  Future<void> getUser(BuildContext context, String email) async {
    state = state.copyWith(isLoading: true);

    var data = await profileUseCase.getUser(email);

    data.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);
        showSnackBar(
          message: 'Invalid Credentials',
          context: context,
          color: Colors.red,
        );
      },
      (success) {
        state =
            state.copyWith(isLoading: false, error: null, currentUser: success);
      },
    );
  }

  void logout(BuildContext context) async {
    // state = true;

    showSnackBar(
        message: 'Logging out....', context: context, color: Colors.red);

    await UserSharedPref().deleteUserToken();

    Future.delayed(const Duration(milliseconds: 2000), () {
      // state = false;

      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoute.loginScreen,
        (route) => false,
      );
    });
  }

  void reset() {
    state = state.copyWith(
      isLoading: false,
      error: null,
      imageName: null,
      showMessage: false,
    );
  }

  void resetMessage() {
    state = state.copyWith(
        showMessage: false, imageName: null, error: null, isLoading: false);
  }
}
