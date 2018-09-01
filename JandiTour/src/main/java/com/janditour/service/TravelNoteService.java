package com.janditour.service;

import java.util.HashMap;
import java.util.List;

import com.janditour.vo.TravelNote;

public interface TravelNoteService {
	
	//게시판에 글을 입력합니다.
	void writeTravelNote(TravelNote travelNote);
	
	//리스트에 입력요소를 주입한다.
	List<TravelNote> findTravelNoteList();
	
	List<TravelNote> findTravelNoteListWithPaging(HashMap<String, Object> params);

	TravelNote findTravelNoteByTrnNo(int trnNo);

	void modifyTravelNoteInfo(TravelNote travelNote);
    
	//게시판 글목록 삭제 합니다.
	void deleteTravelNoteInfo(int trnNo);

	int getTravelNoteCount();
	
	

	


}
