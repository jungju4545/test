package com.cos.action.board;

import com.cos.action.Action;

public class BoardFactory {
	public static Action getAction(String cmd) {
		if(cmd.equals("write")) {
			return new BoardWriteAction();
		}else if(cmd.equals("list")) {
			return new BoardListAction();
		}else if(cmd.equals("detail")) {
			return new BoardDetailAction();
		}else if(cmd.equals("delete")){
			return new BoardDeleteAction(); 
		}
		
		return null;
	}

}
