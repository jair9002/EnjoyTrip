package service;

import java.util.List;

import dao.BoardDao;
import dao.BoardDaoImpl;
import dto.BoardDto;

public class BoardServiceImpl implements BoardService {

	private static BoardServiceImpl instance = new BoardServiceImpl();

	private BoardServiceImpl() {
	}

	public static BoardServiceImpl getInstance() {
		return instance;
	}

	BoardDao dao = BoardDaoImpl.getInstance();

	@Override
	public List<BoardDto> boardList(int limit, int offset) {

		return dao.boardList(limit, offset);
	}

	@Override
	public int boardListTotalCnt() {
		return dao.boardListTotalCnt();
	}

	@Override
	public int boardInsert(BoardDto dto) {
		return dao.boardInsert(dto);
	}

	@Override
	public int boardUpdate(BoardDto dto) {
		return dao.boardUpdate(dto);
	}

	@Override
	public int boardDelete(int boardId) {
		return dao.boardDelete(boardId);
	}

	@Override
	public int boardUpdateReadCount(int boardId, int readCount) {
		return dao.boardUpdateReadCount(boardId, readCount);
	}

	@Override
	public BoardDto boardDetail(int boardId, int userSeq) { // �쁽�옱 �꽭�뀡 �궗�슜�옄�쓽 userSeq
		BoardDto boardDto = dao.boardDetail(boardId);

		int originalReadCount = boardDto.getReadCount();
		boardUpdateReadCount(boardId, originalReadCount + 1);

		if (boardDto.getUserSeq() == userSeq) {
			boardDto.setSameUser(true);

		} else {
			boardDto.setSameUser(false);
		}

		return boardDto;
	}
}
