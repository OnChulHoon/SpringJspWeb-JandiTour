package com.janditour.mapper;

import java.util.HashMap;
import java.util.List;

import com.janditour.vo.TravelNote;

public interface TravelNoteMapper {
     
	//write를 활용할 수 있게 만든다.
	void insertTravelNote(TravelNote travelNote);
	
	//write에서 내용을 리스트입력한다.
	List<TravelNote> selectTravelNoteList();
	
	List<TravelNote> selectTravelNoteListWithPaging(HashMap<String, Object> params);
	
	//list 상세보기 지원
	TravelNote selectTravelNoteInfoByTrnNo(int trnNo);
	
	//게시글 수정
	void updateTravelNoteInfo(TravelNote travelNote);

	//게시글 삭제
	void deleteTravelNoteInfo(int trnNo);
    
	//게시글 목록 페이저
	int selectTravelNoteCount();
}
