package com.janditour.dao;

import java.util.HashMap;
import java.util.List;

import com.janditour.vo.TravelNote;

public interface TravelNoteDao {
	


	void insertTravelNote(TravelNote travelNote);
	
	List<TravelNote> selectTravelNoteList();
	
	List<TravelNote> selectTravelNoteListWithPaging(HashMap<String, Object> params);

	TravelNote selectTravelNoteByTrnNo(int trnNo);

	void updateTravelNote(int trnNo);

	void updateTravelNoteInfo(TravelNote travelNote);

	void deleteTravelNoteInfo(int trnNo);

	int selectTravelNoteCount();
	

}
