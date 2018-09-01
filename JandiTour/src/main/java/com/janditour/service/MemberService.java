package com.janditour.service;

import com.janditour.vo.Member;

public interface MemberService {
	
	void joinMember(Member member);

	Member login(String memId, String memPw);

	Member memberProfile(Member member);

	Member profileImageUpload(Member member);

	Member oldInfoShow(Member member);

	Member selectOldEmail(String memNo);

	void updateEmail(Member member);

	Member selectOldId(String memNo);

	void updateId(Member member);

	Member selectOldPw(String memNo, String memPw);

	void updatePw(Member member);

	Member findId(Member member);

	//Member selectMemberByIdAndPasswd(String memNo, String hashedString);
	


}
