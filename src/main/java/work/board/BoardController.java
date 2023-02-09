package work.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import work.user.UserService;

@Controller
public class BoardController {
	@Resource(name = "boardService")
	private BoardService boardService;

	@Resource(name = "userService")
	private UserService userService;


	@RequestMapping(value="/work/board/boardWrite.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView boardWrite(@ModelAttribute BoardBean board, HttpServletRequest request){
		HttpSession session = request.getSession();

		String userCode = (String)session.getAttribute("userCode");

		ModelAndView mv = new ModelAndView();

		String flag = board.getBoTitle(); //BoardBean 존재여부

		if(flag == null){
			mv.setViewName("/board/bbsWrite");
		}else if(flag != null){
			//게시글 생성
			board.setBoRegId(userCode);
			boardService.boardWrite(board);

			String maxBoardNo = boardService.maxBoardNo();

			mv.setViewName("redirect:/work/board/boardView.do?maxBoardNo=" + maxBoardNo + "&fromCreate=true");
		}

		return mv;
	}
	@RequestMapping(value="/work/board/board.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String goMain(){
//		ModelAndView mv = new ModelAndView();
//
//		mv.setViewName("/intro/index");

		return "redirect:/work/board/boardList.do";
	}

	@RequestMapping(value="/work/board/boardView.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView boardView(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		String boardNo = request.getParameter("maxBoardNo");
		String fromRating = request.getParameter("fromRating");
		String fromCreate = request.getParameter("fromCreate");
		String fromReply = request.getParameter("fromReply");

		if(boardNo == null) boardNo = request.getParameter("boNo");

		Map<String, String> boardParam = new HashMap<String, String>();
		Map<String, String> replyParam = new HashMap<String, String>();

		boardParam.put("boNo", boardNo);
		replyParam.put("boNo", boardNo);

		//조회수 증가
		if(!"true".equals(fromRating) && !"true".equals(fromCreate) && !"true".equals(fromReply) ){
			boardService.updateBoardHits(boardParam);
		}

		Map<String, String> dsBoard = boardService.boardView(boardParam);


		mv.addObject("dsBoard", dsBoard);

		mv.setViewName("/board/bbsView");

		return mv;
	}

	@RequestMapping(value="/work/board/boardList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView boardList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> boardParam = new HashMap<String, String>();

		List<Map<String, String>> dsBoardList = boardService.boardList(boardParam);

		mv.addObject("dsBoardList", dsBoardList);
		mv.setViewName("/board/bbsList");

		return mv;
	}

	@RequestMapping(value="/work/board/deleteBoard.do", method=RequestMethod.GET)
	public ModelAndView deleteBoard(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> boardParam = new HashMap<String, String>();
		Map<String, String> replyParam = new HashMap<String, String>();
		Map<String, String> markParam = new HashMap<String, String>();

		HttpSession session = request.getSession();

		String userCode = (String)session.getAttribute("userCode");
		String boardNo = request.getParameter("boNo");

		boardParam.put("userCode", userCode);
		boardParam.put("boNo", boardNo);

		replyParam.put("boNo", boardNo);

		markParam.put("boNo", boardNo);

		//글 삭제
		boardService.deleteBoard(boardParam);

		mv.setViewName("redirect:/work/board/boardList.do");

		return mv;
	}

	@RequestMapping(value="/work/board/updateBoardRating.do", method=RequestMethod.GET)
	public ModelAndView updateBoardRating(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, String> boardParam = new HashMap<String, String>();
		Map<String, String> markParam = new HashMap<String, String>();

		String userCode = (String)session.getAttribute("userCode");
		String boardNo = request.getParameter("boNo");

		boardParam.put("boNo", boardNo);

		markParam.put("userCode", userCode);
		markParam.put("boNo", boardNo);

		mv.setViewName("redirect:/work/board/boardView.do?boNo=" + boardNo + "&fromRating=true");

		return mv;
	}

	@RequestMapping(value="/work/board/boardModify.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView boardModify(HttpServletRequest request, @ModelAttribute BoardBean bean){
		Map<String, String> boardParam = new HashMap<String, String>();
		ModelAndView mv = new ModelAndView();
        String boardNo = request.getParameter("boNo"); //없으면 GET(create안함), 있으면 POST(create)

        String flag = bean.getBoTitle();
        boardParam.put("boNo", boardNo);

        Map<String, String> dsBoard = boardService.boardView(boardParam);

		if(flag == null){
			mv.addObject("dsBoard", dsBoard);
			mv.setViewName("/board/bbsModify");
		}else{
			boardService.boardModify(bean);
			mv.setViewName("/work/board/boardView.do?boNo=" + boardNo + "&fromUpdate=true");
		}
		return mv;
	}

}
