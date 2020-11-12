/*
 * File: home_repository.dart
 * Project: CVideo
 * File Created: Friday, 12th June 2020 8:08:14 am
 * Author: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Last Modified: Friday, 12th June 2020 9:14:41 pm
 * Modified By: minhndse130706 (minhndse130706@fpt.edu.vn)
 * -----
 * Copyright (C) Daxua Team
 */
import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:cvideo_employer_mobile/src/models/recruitment_post_detail.dart';
import 'post_provider.dart';

class PostRepository {
  PostProvider _postProvider = PostProvider();

  Future<RecruitmentPostDetail> fetchRecruitmentPostDetail(
          int postId, String lang) =>
      _postProvider.fetchRecruitmentPostDetail(postId, lang);

  Future<List<Skills>> fetchSkillsList(String lang) =>
      _postProvider.fetchSkillsList(lang);

  Future<String> updateRecruitmentPostInfo(
          int postId, RecruitmentPostInfor recruitmentPostInfor) =>
      _postProvider.updateRecruitmentPostInfo(postId, recruitmentPostInfor);
  Future<String> createRecruitmentPost(
          RecruitmentPostInfor recruitmentPostInfor, int companyId) =>
      _postProvider.createRecruitmentPost(recruitmentPostInfor, companyId);
}
