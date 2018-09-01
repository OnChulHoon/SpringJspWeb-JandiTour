package com.janditour.dao;

import java.util.HashMap;

import com.janditour.mapper.MemberMapper;
import com.janditour.vo.Member;

public class OracleMemberDao implements MemberDao {
	private MemberMapper memberMapper;

	public void setMemberMapper(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}

	@Override
	public void insertMember(Member member) {
		memberMapper.insertMember(member);
	}

	@Override
	public Member selectMember(String memId, String memPw) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("memId", memId);
		params.put("memPw", memPw);

		Member member = memberMapper.selectMember(params);
		return member;
	}

	@Override
	public Member selectProfile(Member member) {
		member = memberMapper.selectProfile(member);
		return member;
	}

	@Override
	public Member selectImageUpload(Member member) {
		memberMapper.updateImgUpload(member);
	return member;
	}

	@Override
	public Member oldShow(Member member) {
		member = memberMapper.selectOldInfo(member);
		return member;
	}

	@Override
	public Member selectEmail(String memNo) {
		Member member = memberMapper.selectOldEmail(memNo);
		return member;
	}

	@Override
	public void updateEmailInfo(Member member) {
		memberMapper.updateEmail(member);
	}

	@Override
	public Member selectId(String memNo) {
		Member member = memberMapper.selectOldId(memNo);
		return member;
	}

	@Override
	public void updateIdInfo(Member member) {
		memberMapper.updateId(member);
		
	}

	@Override
	public Member selectPw(String memNo, String memPw) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("memNo", memNo);
		params.put("memPw", memPw);

		Member member = memberMapper.selectPw(params);
		return member;
	}

	@Override
	public void updatePwInfo(Member member) {
		memberMapper.updatePw(member);
	}

	@Override
	public Member findMyId(Member member) {
		member = memberMapper.selectMyId(member);
		return member;
	}

	
}
