package com.janditour.mapper;

import java.util.HashMap;

import com.janditour.vo.Member;

public interface MemberMapper {

	void insertMember(Member member);

	Member selectMember(HashMap<String, Object> params);

	Member selectProfile(Member member);

	Member updateImgUpload(Member member);

	Member selectOldInfo(Member member);

	Member selectEmail(Member member);

	Member selectOldEmail(String memNo);

	void updateEmailInfo(String newEmail);

	void updateEmail(Member member);

	Member selectOldId(String memNo);

	void updateId(Member member);

	Member selectPw(HashMap<String, Object> params);

	void updatePw(Member member);

	Member selectMyId(Member member);


}
