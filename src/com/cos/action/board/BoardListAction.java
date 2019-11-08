package com.cos.action.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.eclipse.jdt.internal.compiler.ast.ForeachStatement;

import com.cos.action.Action;
import com.cos.dao.BoardDao;
import com.cos.model.Board;
import com.cos.utill.Utils;


public class BoardListAction implements Action{
	private final static String TAG  = "BoardListAction";
@Override
public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	if(request.getParameter("page")==null) return;
	int page = Integer.parseInt(request.getParameter("page"));
	// page <= 0 or page>maxNum 버튼 비활성화
	if(page<=0 ) {
		page=1;
	}
	
	BoardDao bDao = new BoardDao();
	
	
	List<Board> boards = bDao.findAll(page);// 페이징하기
	List<Board> hotBoards = bDao.findOrderByReadCountDesc();// 인기리스트
	
	Utils.setPreviewImg(boards);
	Utils.setPreviewContent(boards);
	
	
	
	request.setAttribute("boards", boards);
	request.setAttribute("hotBoards", hotBoards);
	
	
	Utils.setPreviewContent(hotBoards);
	
	RequestDispatcher dis = request.getRequestDispatcher("board/list.jsp");
	dis.forward(request, response);
}
}
