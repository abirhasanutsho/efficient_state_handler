import 'package:state_handeler/state/data_state.dart';

import '../models/profile.dart';

class ProfileController {
  DS<Profile> profileInfo = Loading<Profile>();

  Future<void> fetchData() async {
    try {
      profileInfo = Fetched(
        Profile(
          imgUrl:
              "https://scontent.fdac136-1.fna.fbcdn.net/v/t39.30808-6/399447443_946973340181866_3948201242798537464_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeHAA1exjoWpfdddhNbPW7Ftpfhay3DZNi6l-FrLcNk2Lu2NPlDBtOLqN_8mdo0N3Ap--Wu6olYIrTpKVNACH2XV&_nc_ohc=esn3p0pyjGIAX-yOtAL&_nc_ht=scontent.fdac136-1.fna&oh=00_AfBCv7Nq6PPqXO98MNtn0GzkfjmiVnmlx_1S8ySOO0qbfg&oe=65727D22",
          name: "Abir Hasan",
          description: "Hello I Am Full Stack Developer",
        ),
      );
    } catch (e) {
      profileInfo = Failed(e);
    }
  }

  void setLoading() {
    profileInfo = Loading();
  }

  void setFailed() {
    profileInfo = Failed('Something went wrong');
  }
}
