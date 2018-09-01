package com.janditour.dao;

import java.util.HashMap;
import java.util.List;

import com.janditour.mapper.TravelNoteMapper;
import com.janditour.vo.TravelNote;

public class OracleTravelNoteDao implements TravelNoteDao {

	private TravelNoteMapper travelNoteMapper;
	
	
	public void setTravelNoteMapper(TravelNoteMapper travelNoteMapper) {
		this.travelNoteMapper = travelNoteMapper;
	}
	
	@Override
	public void insertTravelNote(TravelNote travelNote) {
		
		travelNoteMapper.insertTravelNote(travelNote);
		
	}

	@Override
	public List<TravelNote> selectTravelNoteList() {
		List<TravelNote> noteList = travelNoteMapper.selectTravelNoteList();
		return noteList;
	}
	
	@Override
	public List<TravelNote> selectTravelNoteListWithPaging(HashMap<String, Object> params) {
		List<TravelNote> noteList = travelNoteMapper.selectTravelNoteListWithPaging(params);
		return noteList;
	}

	@Override
	public TravelNote selectTravelNoteByTrnNo(int trnNo) {
		TravelNote travelNote = travelNoteMapper.selectTravelNoteInfoByTrnNo(trnNo);
		return travelNote;
	}

	@Override
	public void updateTravelNote(int trnNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateTravelNoteInfo(TravelNote travelNote) {
		travelNoteMapper.updateTravelNoteInfo(travelNote);
		
	}

	@Override
	public void deleteTravelNoteInfo(int trnNo) {
		
		travelNoteMapper.deleteTravelNoteInfo(trnNo);
		
	}

	@Override
	public int selectTravelNoteCount() {
		
		return travelNoteMapper.selectTravelNoteCount();
	}






}
