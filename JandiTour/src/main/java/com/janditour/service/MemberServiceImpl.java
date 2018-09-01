package com.janditour.service;


import com.janditour.common.Util;
import com.janditour.dao.MemberDao;
import com.janditour.vo.Member;

public class MemberServiceImpl implements MemberService{
	
	private MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public void joinMember(Member member) {
		String hashedPasswd = Util.getHashedString(member.getMemPw(),"SHA-256");
		member.setMemPw(hashedPasswd);
		memberDao.insertMember(member);
		
	}

	@Override
	public Member login(String memId, String memPw) {
		String hashedPasswd = Util.getHashedString(memPw,"SHA-256");
		Member member = memberDao.selectMember(memId, hashedPasswd);
		return member;
	}

	@Override
	public Member memberProfile(Member member) {
	member = memberDao.selectProfile(member);
		return member;
	}

	@Override
	public Member profileImageUpload(Member member) {
		memberDao.selectImageUpload(member);
	return member;
	}

	@Override
	public Member oldInfoShow(Member member) {
		member = memberDao.oldShow(member);
		return member;
	}

	@Override
	public Member selectOldEmail(String memNo) {
		Member member = memberDao.selectEmail(memNo);
		return member;
	}

	@Override
	public void updateEmail(Member member) {
		memberDao.updateEmailInfo(member);
	}

	@Override
	public Member selectOldId(String memNo) {
		Member member = memberDao.selectId(memNo);
		return member;
	}

	@Override
	public void updateId(Member member) {
		memberDao.updateIdInfo(member);
		
	}

	@Override
	public Member selectOldPw(String memNo, String memPw) {
		String hashedPasswd = Util.getHashedString(memPw,"SHA-256");
		Member member = memberDao.selectPw(memNo, hashedPasswd);
		return member;
	}

	@Override
	public void updatePw(Member member) {
		String hashedPasswd = Util.getHashedString(member.getMemPw(),"SHA-256");
		member.setMemPw(hashedPasswd);
		memberDao.updatePwInfo(member);
	}

	@Override
	public Member findId(Member member) {
		member = memberDao.findMyId(member);
		return member;
	}

	

	
}
