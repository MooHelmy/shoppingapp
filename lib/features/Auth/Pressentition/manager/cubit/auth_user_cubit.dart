import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_user_state.dart';

class AuthUserCubit extends Cubit<AuthUserState> {
  AuthUserCubit() : super(AuthUserInitial());
  login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(Loginfailure(message: ('No user found for that email.')));
      } else if (e.code == 'wrong-password') {
        emit(Loginfailure(message: ('Wrong password provided for that user.')));
      }
    }
  }

  register({required String email, required String password}) async {
    emit(SigninLoading());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(SigninSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(Signinfailure(message: ('weakpassword')));
      } else if (e.code == 'email-already-in-use') {
        emit(Signinfailure(message: ('email is already use')));
      }
    } catch (e) {
      emit(Signinfailure(message: e.toString()));
    }
  }
}
