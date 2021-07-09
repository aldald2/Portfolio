package com.kh.relief.board.model.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.relief.board.model.service.BoardService;
import com.kh.relief.board.model.vo.Board;
import com.kh.relief.board.model.vo.BoardImage;
import com.kh.relief.board.model.vo.Image;
import com.kh.relief.board.model.vo.Search;
import com.kh.relief.board.model.vo.Wish;
import com.kh.relief.board.model.dao.BoardDao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.relief.admin.model.vo.Category;
import com.kh.relief.admin.model.vo.Report;
import com.kh.relief.notice.model.vo.Notice;
import com.kh.relief.review.model.vo.Review;
import com.kh.relief.board.model.dao.BoardDao;
import com.kh.relief.board.model.vo.Board;
import com.kh.relief.board.model.vo.CategoryBoard;
import com.kh.relief.board.model.vo.Image;
import com.kh.relief.board.model.vo.PageInfo;
import com.kh.relief.board.model.vo.Reply;
import com.kh.relief.board.model.vo.SearchBoard;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao bDao;

	@Override
	public int selectbListCount(SearchBoard sb) {
		return bDao.selectbListCount(sb);
	}

	@Override
	public List<Board> selectbList(SearchBoard sb, PageInfo pi) {
		return bDao.selectbList(sb,pi);
	}

	@Override
	public Image selectiList(int board_id) {
		return bDao.selectiList(board_id);
	}

	@Override
	public List<Board> descbList(SearchBoard sb, PageInfo pi) {
		return bDao.descbList(sb,pi);
	}

	@Override
	public List<Board> ascbList(SearchBoard sb, PageInfo pi) {
		return bDao.ascbList(sb,pi);
	}

	@Override
	public List<Category> selectcList() {
		return bDao.selectcList();
	}

	@Override
	public Category selectCategory1(int cid) {
		return bDao.selectCategory1(cid);
	}

	@Override
	public List<Category> selectcListFromCid2(int cid) {
		return bDao.selectcListFromCid2(cid);
	}

	@Override
	public List<Category> selectcListFromiList(List<Integer> iList) {
		return bDao.selectcListFromiList(iList);
	}

	@Override
	public int selectbListFromCategoryCount(CategoryBoard cb) {
		return bDao.selectbListFromCategoryCount(cb);
	}

	@Override
	public List<Board> selectbListFromCategory(CategoryBoard cb, PageInfo pi) {
		return bDao.selectbListFromCategory(cb, pi);
	}
	
	@Override
	public int selectbListFromCategoryCount2(CategoryBoard cb) {
		return bDao.selectbListFromCategoryCount2(cb);
	}

	@Override
	public List<Board> selectbListFromCategory2(CategoryBoard cb, PageInfo pi) {
		return bDao.selectbListFromCategory2(cb, pi);
	}
	
	@Override
	public List<Board> selectTodayList() {
		return bDao.selectTodayList();
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Board selectBoard(int board_id, boolean flag) {
		if(flag) bDao.updateReadCount(board_id);
		return bDao.selectBoard(board_id);
	}

	@Override
	public Image selectImage(int board_id) {
		return bDao.selectImage(board_id);
	}

	@Override
	public List<Image> selectImageList(int board_id) {
		return bDao.selectImageList(board_id);
	}

	@Override
	public int insertWish(Wish w) {
		return bDao.insertWish(w);
	}

	@Override
	public Wish selectWish(Wish w) {
		return bDao.selectWish(w);
	}

	@Override
	public int wishCount(String aid) {
		return bDao.wishCount(aid);
	}

	@Override
	public List<Category> selectCategory() {
		return bDao.selectCategory();
	}

	@Override
	public List<Category> selectCategory2(int cid) {
		return bDao.selectCategory2(cid);
	}

	@Override
	public int insertBoard(Board b) {
		return bDao.insertBoard(b);
	}

	@Override
	public int insertImage(BoardImage bi) {
		return bDao.insertImage(bi);
	}

	@Override
	public int selectbId() {
		return bDao.selectbId();
	}

	@Override
	public int reportUser(Report r) {
		return bDao.reportUser(r);
	}

	@Override
	public int reportUser2(Report r) {
		return bDao.reportUser2(r);
	}

	@Override
	public int reportUser3(Report r) {
		return bDao.reportUser3(r);
	}
	public List<Notice> selectadList() {
		return bDao.selectadList();
	}

	@Override
	public List<Review> selectrList(String account_id) {
		return bDao.selectrList(account_id);
	}

	@Override
	public List<Reply> insertReply(Reply r) {
		bDao.insertReply(r);
		return bDao.selectReplyList(r.getBid());
	}

	@Override
	public List<Reply> selectReplyList(int board_id) {
		return bDao.selectReplyList(board_id);
	}

	@Override
	public List<Reply> insertReply2(Reply r) {
		bDao.insertReply2(r);
		return bDao.selectReplyList(r.getBid());
	}

	@Override
	public List<Reply> selectReply2List(int board_id) {
		return bDao.selectReply2List(board_id);
	}

	public int nLoginListCount(String searchValue) {
		return bDao.nLoginListCount(searchValue);
	}

	@Override
	public List<Board> nLoginList(PageInfo pi, String searchValue) {
		return bDao.nLoginList(pi, searchValue);
	}

	@Override
	public int insertThistory(Board board) {
		return bDao.insertThistory(board);
	}

	@Override
	public int insertImage2(BoardImage bi2) {
		return bDao.insertImage2(bi2);
	}

	@Override
	public int deleteImage(int iid) {
		return bDao.deleteImage(iid);
	}

	@Override
	public int updateBoard(Board b) {
		return bDao.updateBoard(b);
	}

	
}
