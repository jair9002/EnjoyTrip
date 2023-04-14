package dao;

import java.util.List;

import dto.BoardDto;

public interface BoardDao {
	List<BoardDto> boardList(int limit, int offset);
	int boardListTotalCnt();

	int boardInsert(BoardDto dto);
    int boardUpdate(BoardDto dto);
    int boardDelete(int boardId);
    int boardUpdateReadCount(int boardId, int readCount );
    
    BoardDto boardDetail(int boardId);
}
