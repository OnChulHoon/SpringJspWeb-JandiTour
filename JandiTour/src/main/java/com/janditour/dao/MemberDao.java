package com.janditour.dao;

import com.janditour.vo.Member;

public interface MemberDao {

	void insertMember(Member member);

	Member selectMember(String memId, String memPw);

	Member selectProfile(Member member);

	Member selectImageUpload(Member member);

	Member oldShow(Member member);

	Member selectEmail(String memNo);

	void updateEmailInfo(Member member);

	Member selectId(String memNo);

	void updateIdInfo(Member member);

	Member selectPw(String memNo, String memPw);

	void updatePwInfo(Member member);

	Member findMyId(Member member);

	

}
