package com.spring.board.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class boardController {
	@Autowired
	boardDAO dao;
	
	@ModelAttribute("cp")
	public String getContextPath(HttpServletRequest request) {
		return request.getContextPath();
	}
	
	@RequestMapping(value = "/board/main")
	public String boardList(HttpServletRequest request, Model model) {
		System.out.println("===========보드메인시작======================");
		HttpSession session=request.getSession();
		
		Object obj=session.getAttribute("type");
		String type[]=(String[])obj;
		
		boolean typeCheck=false;
		if(type != null) {
			if(type.length==0) {
				typeCheck=true;
			}else {
				for(int i=0;i<type.length;i++) {
					if(type[i].equals("전체")) {
						typeCheck=true;
					}
				}
			}
		}else {
			typeCheck=true;
		}
		
		ArrayList<boardDTO>boardList;
		//typeCheck이 true이면 전체게시물출력
		if(typeCheck==true) {
			boardList=dao.getBoardList();
			//false이면 type별 게시물 출력
		}else {
			boardList=dao.getTypeBoardList(type);
			session.setAttribute("type", type);
		}
		
		int size=boardList.size();
		//페이지당 보여질 게시글수
		int pageSize=10;
		//현재페이지
		int index=0;
		if(request.getParameter("pagenum") != null) {
			index=Integer.parseInt(request.getParameter("pagenum"));
		}
		if(request.getParameter("pagenum2") !=null	) {
			int temp=Integer.parseInt(request.getParameter("pagenum2"));
			index=temp/10*10;
		}
		int count=10;
		//페이지의 시작할 게시글 index
		int start=0;
		//1페이지 이외에는 게시글이 pageSize만큼 보여줘야한다
		if(index!=0){
			if(size%pageSize==0) {
				index+=1;
			}
			start=(index-1)*pageSize+size%pageSize;
		}
		//페이지의 마지막 게시글 index
		int end=start+pageSize;
		//index가 0이면 1페이지
		if(index==0 && size%pageSize!=0){
			//게시글순서는 역순이고 1페이지의 게시글개수는 유동적이다
			end=size%pageSize;
		}
		if(size%pageSize==0 && index!=0) {
			index-=1;
		}
		//전체페이지 개수
		int paging=size/pageSize;
		//size를pageSize로 나누고 나머지가 있다면 그나머지 만큼을 보여줄 페이지가 필요하기때문에 +1
		if(size%pageSize!=0){
			paging+=1;
		}
		//시작 페이지
		//ex)현재페이지가 1~10사이이면 startP는 0
		int startP=index/pageSize*pageSize;
		//끝나는 페이지
		//시작페이지에 pageSize를 더한다
		int endP=startP+pageSize;
		//이전 시작페이지 범위로 이동한다
		int Previous=0;
		//다음 시작페이지 범위로 이동한다
		int next=0;
		
		//paging이 시작페이지범위에 속한다면 마지막페이지는 paging
		if(startP==paging/pageSize*pageSize){
			endP=paging;
			//더이상 다음페이지가 없기때문에 비활성화
			next=1;
		}
		//현재페이지가 1~10이면 
		if(startP==0) {
			//더이상 이전페이지가 없기때문에 비활성화
			Previous=1;
		}
		endP-=1;
		end-=1;
		model.addAttribute("boardList", boardList);
		model.addAttribute("startP", startP);
		model.addAttribute("endP", endP);
		model.addAttribute("size", size);
		model.addAttribute("paging", paging);
		model.addAttribute("index", index);
		model.addAttribute("Previous", Previous);
		model.addAttribute("next", next);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("type", type);
		System.out.println("===========보드메인 끝======================");
		return "board/main";
	}
	@RequestMapping(value = "/board/boardType")
	public String boardType(HttpServletRequest request, Model model) {
		System.out.println("===========보드타입시작======================");
		HttpSession session=request.getSession();
		//type을 request하는 메소드를 만들어 session에 저장한다
		String []type=request.getParameterValues("type");
		session.setAttribute("type", type);
		System.out.println("===========보드타입끝======================");
		return "redirect:/board/main";
				
	}
	@RequestMapping(value = "/board/boardWrite")
	public String boardWrite(HttpServletRequest request, Model model) {
		System.out.println("===========보드글쓰기시작======================");
		
		int size=dao.boardMaxsize();
		System.out.println("size = "+size);
		model.addAttribute("size",size);
		
		System.out.println("===========보드글쓰기끝======================");
		return "/board/05_boardWrite";
				
	}	
	@RequestMapping(value = "/board/boardWritePro")
	public String boardWritePro(HttpServletRequest request, Model model) {
		System.out.println("===========보드글쓰기 프로 시작======================");
		
		String title=request.getParameter("title");
		String name=request.getParameter("name");
		String pw=request.getParameter("pw");
		String type=request.getParameter("type");
		String content=request.getParameter("content");
		boardDTO board=new boardDTO();
		board.setTitle(title);
		board.setName(name);
		board.setPw(pw);
		board.setType(type);
		board.setContent(content);
		
		int check=dao.boardWrite(board);
		
		model.addAttribute("check",check);
		System.out.println("===========보드글쓰기 프로 끝======================");
		return "/board/05_boardWritePro";
				
	}
	@RequestMapping(value = "/board/boardUpdate")
	public String boardUpdate(HttpServletRequest request, Model model) {
		System.out.println("===========보드글확인 시작======================");
		
		int no=Integer.parseInt(request.getParameter("number"));
		boardDTO board=dao.selBoard(no);
		
		model.addAttribute("board",board);
		System.out.println("===========보드글확인 끝======================");
		return "/board/06_boardUpdate";
				
	}
	@RequestMapping(value = "/board/boardUpdateCheck")
	public String boardUpdateCheck(HttpServletRequest request, Model model) {
		System.out.println("===========보드글수정체크 시작======================");
		
		String pw=request.getParameter("pw");
		int num=Integer.parseInt(request.getParameter("num"));
		int check=dao.boardPwCheck(pw, num);
		
		model.addAttribute("check",check);
		
		System.out.println("===========보드글수정체크 끝======================");
		return "/board/06_boardUpdateCheck";
				
	}
	@RequestMapping(value = "/board/boardUpdatePro")
	public String boardUpdatePro(HttpServletRequest request, Model model) {
		System.out.println("===========보드글수정프로 시작======================");
		
		int no=Integer.parseInt(request.getParameter("num"));
		boardDTO board=dao.selBoard(no);
		
		model.addAttribute("board",board);
		System.out.println("===========보드글수정프로 끝======================");
		return "/board/06_boardUpdatePro";
				
	}
	@RequestMapping(value = "/board/boardUpdatePro2")
	public String boardUpdatePro2(HttpServletRequest request, Model model) {
		System.out.println("===========보드글수정프로2 시작======================");
		
		int num=Integer.parseInt(request.getParameter("num"));
		String title=request.getParameter("title");
		String name=request.getParameter("name");
		String pw=request.getParameter("pw");
		String type=request.getParameter("type");
		String content=request.getParameter("content");
		
		boardDTO board=new boardDTO();
		board.setNum(num);
		board.setTitle(title);
		board.setName(name);
		board.setPw(pw);
		board.setType(type);
		board.setContent(content);
		
		int check=dao.update(board);
		model.addAttribute("check",check);
		System.out.println("===========보드글수정프로2 끝======================");
		return "/board/06_boardUpdatePro2";
				
	}
	
}
