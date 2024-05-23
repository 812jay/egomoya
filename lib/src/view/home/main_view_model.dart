import 'package:egomoya/src/model/celeb/celeb.dart';
import 'package:egomoya/src/model/celeb/celeb_type.dart';
import 'package:egomoya/src/model/main/main_category.dart';
import 'package:egomoya/src/model/question/question.dart';
import 'package:egomoya/src/model/user/user.dart';
import 'package:egomoya/src/repo/celeb_repo.dart';
import 'package:egomoya/src/repo/image_repo.dart';
import 'package:egomoya/src/repo/question_repo.dart';
import 'package:egomoya/src/repo/user_repo.dart';
import 'package:egomoya/src/service/celeb_service.dart';
import 'package:egomoya/src/service/user_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/src/view/question/question_add_view_model.dart';
import 'package:egomoya/src/view/question/question_detail_view_model.dart';
import 'package:egomoya/util/helper/immutable_helper.dart';
import 'package:egomoya/util/route_path.dart';
import 'package:flutter/material.dart';

class MainViewModel extends BaseViewModel {
  MainViewModel({
    required this.celebRepo,
    required this.imageRepo,
    required this.questionRepo,
    required this.userRepo,
    required this.userService,
    required this.celebService,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await setUser();
      await fetchCelebList();
      await fetchQuestionList();
      userService.addListener(notifyListeners);
    });
  }
  final CelebRepo celebRepo;
  final ImageRepo imageRepo;
  final QuestionRepo questionRepo;
  final UserRepo userRepo;
  final UserService userService;
  final CelebService celebService;

  List<Celeb> get celebList => celebService.celebList;

  String get userId => userService.userId;
  UserRes? get user => userService.user;
  String? get profileImgUrl => userService.profileImgUrl;

  //category
  List<MainCategory> categoryList = [
    MainCategory(index: 0, title: '홈', isActive: true),
    MainCategory(index: 1, title: '셀럽템', isActive: false),
    MainCategory(index: 2, title: '요고 궁금', isActive: false),
  ];
  int selectedCategoryIndex = 0;

  //question
  List<QuestionRes> questionList = [];

  //celeb
  CelebCategory selectedCelebCategory = CelebCategory.beauty;

  List<Celeb> get selectedCelebList => selectedCelebCategory ==
          CelebCategory.beauty
      ? celebList.where((e) => e.category == CelebCategory.beauty).toList()
      : celebList.where((e) => e.category == CelebCategory.fashion).toList();

  @override
  void dispose() {
    super.dispose();
    userService.removeListener(notifyListeners);
  }

  Future<void> fetchCelebList() async {
    final response = await celebRepo.fetchCelebList();
    response
      ..onFailure((e) => showToast('셀럽 데이터를 불러오는데 실패했어요'))
      ..onSuccess((newCelebList) {
        isBusy = true;
        celebService.setCelebList(newCelebList);
        isBusy = false;
      });
  }

  Future<void> fetchQuestionList() async {
    final response = await questionRepo.fetchQuestionList(limit: 10, offset: 0);
    response
      ..onFailure((e) => null)
      ..onSuccess((newQuestionList) {
        isBusy = true;
        questionList = newQuestionList;
        isBusy = false;
      });
  }

  Future<void> setUser() async {
    if (userService.userId.isEmpty) return;
    isBusy = true;
    final UserRes? newUser = await getUser();
    if (newUser != null) {
      String? imgUrl;
      if (newUser.profileImgName != null) {
        String imgRef = 'images/profile/${newUser.profileImgName!}';
        imgUrl = await getImagePath(imgRef);
      }
      userService.setUser(newUser, imgUrl);
    }
    isBusy = false;
  }

  Future<UserRes?> getUser() async {
    UserRes? result;
    final response = await userRepo.fetchUser(userService.userId);
    response
      ..onFailure((e) => showToast('유저 정보를 불러오는데 실패했어요'))
      ..onSuccess((newUser) async {
        result = newUser;
      });
    return result;
  }

  Future<String?> getImagePath(String imgRef) async {
    String? result;
    final response = await imageRepo.fetchImage(imgRef: imgRef);
    response
      ..onFailure((e) => null)
      ..onSuccess((imgPath) {
        result = imgPath;
      });
    return result;
  }

  void onTapCategory(int index) {
    if (selectedCategoryIndex == index) return;
    final category = categoryList[index];
    onChangeCategory(index, category.copyWith(isActive: !category.isActive));
    selectedCategoryIndex = index;
    notifyListeners();
  }

  void onChangeCategory(int index, MainCategory newCategory) {
    //clear
    categoryList =
        categoryList.map((e) => e.copyWith(isActive: false)).toImmutable();
    //set
    categoryList = categoryList
        .asMap()
        .entries
        .map((e) => e.key == index ? newCategory : e.value)
        .toImmutable();
  }

  navigateToQuestionAdd(BuildContext context) {
    if (user == null) return;
    Navigator.pushNamed(
      context,
      RoutePath.questionAdd,
      arguments: QuestionAddViewArgument(user: user!),
    );
  }

  navigateToQuestionDetail(
    BuildContext context, {
    required String questionId,
  }) {
    Navigator.pushNamed(
      context,
      RoutePath.questionDetail,
      arguments: QuestionDetailViewArgument(
        questionId: questionId,
      ),
    );
  }

  void onTapCelebCategory(CelebCategory newCategory) {
    selectedCelebCategory = newCategory;
    notifyListeners();
  }
}
