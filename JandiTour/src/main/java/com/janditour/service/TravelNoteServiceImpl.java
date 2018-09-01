package com.janditour.service;

import java.util.HashMap;
import java.util.List;

import com.janditour.dao.TravelNoteDao;
import com.janditour.vo.TravelNote;

public class TravelNoteServiceImpl implements TravelNoteService {
	
	private TravelNoteDao travelNoteDao;	
	public void setTravelNoteDao(TravelNoteDao travelNoteDao) {
		this.travelNoteDao = travelNoteDao;
	}
	
	
	@Override
	public void writeTravelNote(TravelNote travelNote) {
		
		travelNoteDao.insertTravelNote(travelNote);
		
	}


	@Override
	public List<TravelNote> findTravelNoteList() {
		//데이터베이스에서 게시물 목록 조회 (DAO 객체에 요청)
	  List<TravelNote> travelNotes	= travelNoteDao.selectTravelNoteList();
	   //조회 결과 반환
		return travelNotes;
	}
	
	@Override
	public List<TravelNote> findTravelNoteListWithPaging(HashMap<String, Object> params) {
		//데이터베이스에서 게시물 목록 조회 (DAO 객체에 요청)
	  List<TravelNote> travelNotes	= travelNoteDao.selectTravelNoteListWithPaging(params);
	   //조회 결과 반환
		return travelNotes;
	}


	@Override
	public TravelNote findTravelNoteByTrnNo(int trnNo) {
		//데이터베이스에서 게시물 목록 조회 (DAO 객체에 요청)
		TravelNote travelNote = travelNoteDao.selectTravelNoteByTrnNo(trnNo);
		
		return travelNote;
	}


	@Override
	public void modifyTravelNoteInfo(TravelNote travelNote) {
	     
		travelNoteDao.updateTravelNoteInfo(travelNote);
		
		
	}

    //글목록을 삭제하기 위한 서비스 목록
	@Override
	public void deleteTravelNoteInfo(int trnNo) {
		
		travelNoteDao.deleteTravelNoteInfo(trnNo);
		
	}


	@Override
	public int getTravelNoteCount() {
		 
		
		return travelNoteDao.selectTravelNoteCount();
	}











}
