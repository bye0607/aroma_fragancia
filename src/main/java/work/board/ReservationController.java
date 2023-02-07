package work.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import work.board.BoardBean;
import work.board.BoardService;
import work.user.UserService;

@Controller
public class ReservationController {
	
	@Resource(name = "reservationService")
	private ReservationService reservationService;



	@RequestMapping(value="/work/board/createVst.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView createBoard(@ModelAttribute ReservationBean vst, HttpServletRequest request){
		HttpSession session = request.getSession();

		String userCode = (String)session.getAttribute("userCode");

		ModelAndView mv = new ModelAndView();

		String flag = vst.getVstTitle(); //BoardBean 존재여부

		if(flag == null){
			mv.setViewName("/board/VstRegisterC");
		}else if(flag != null){
			//게시글 생성
//			vst.setUserCode(userCode);
			reservationService.createVst(vst);

			String maxVstNo = reservationService.retrieveMaxVstNo();

			mv.setViewName("redirect:/work/board/retrieveVst.do?maxVstNo=" + maxVstNo + "&fromCreate=true");
		}

		return mv;
	}
	@RequestMapping(value="/work/board/goMain.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String goMain(){
//		ModelAndView mv = new ModelAndView();
//
//		mv.setViewName("/intro/index");

		return "redirect:/intro/index.jsp";
	}

	@RequestMapping(value="/work/board/retrieveVst.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView retrieveBoard(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		String VstNo = request.getParameter("maxVstNo");
		String fromRating = request.getParameter("fromRating");
		String fromCreate = request.getParameter("fromCreate");
		String fromReply = request.getParameter("fromReply");

		if(VstNo == null) VstNo = request.getParameter("VstNo");

		Map<String, String> boardParam = new HashMap<String, String>();
		Map<String, String> replyParam = new HashMap<String, String>();

		boardParam.put("VstNo", VstNo);
		replyParam.put("VstNo", VstNo);

		//조회수 증가
		if(!"true".equals(fromRating) && !"true".equals(fromCreate) && !"true".equals(fromReply) ){
			reservationService.updateVstHits(replyParam);
		}

		Map<String, String> dsVst = reservationService.retrieveVst(replyParam);


		mv.addObject("dsVst", dsVst);

		mv.setViewName("/board/VstR");

		return mv;
	}

	@RequestMapping(value="/work/board/retrieveVstList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView retrieveVstList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> vstParam = new HashMap<String, String>();

		List<Map<String, String>> dsVstList = reservationService.retrieveVstList(vstParam);

		mv.addObject("dsVstList", dsVstList);
		mv.setViewName("/board/VstListR");

		return mv;
	}

	@RequestMapping(value="/work/board/deleteVst.do", method=RequestMethod.GET)
	public ModelAndView deleteVst(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> vstParam = new HashMap<String, String>();
		Map<String, String> replyParam = new HashMap<String, String>();
		Map<String, String> markParam = new HashMap<String, String>();

		HttpSession session = request.getSession();

		String userCode = (String)session.getAttribute("userCode");
		String vstNo = request.getParameter("vstNo");

		vstParam.put("userCode", userCode);
		vstParam.put("vstNo", vstNo);

		replyParam.put("vstNo", vstNo);

		markParam.put("vstNo", vstNo);

		//글 삭제
		reservationService.deleteVst(vstParam);

		mv.setViewName("redirect:/work/board/retrieveVstList.do");

		return mv;
	}

	@RequestMapping(value="/work/board/updateVstRating.do", method=RequestMethod.GET)
	public ModelAndView updateVstRating(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, String> vstParam = new HashMap<String, String>();
		Map<String, String> markParam = new HashMap<String, String>();

		String userCode = (String)session.getAttribute("userCode");
		String vstNo = request.getParameter("vstNo");

		vstParam.put("vstNo", vstNo);

		markParam.put("userCode", userCode);
		markParam.put("vstNo", vstNo);

		mv.setViewName("redirect:/work/board/retrieveVst.do?vstNo=" + vstNo + "&fromRating=true");

		return mv;
	}

	@RequestMapping(value="/work/board/updateVst.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateBoard(HttpServletRequest request, @ModelAttribute ReservationBean bean){
		Map<String, String> vstParam = new HashMap<String, String>();
		ModelAndView mv = new ModelAndView();
        String vstNo = request.getParameter("vstNo"); //없으면 GET(create안함), 있으면 POST(create)

        String flag = bean.getVstTitle();
        vstParam.put("vstNo", vstNo);

        Map<String, String> dsVst = reservationService.retrieveVst(vstParam);

		if(flag == null){
			mv.addObject("dsVst", dsVst);
			mv.setViewName("/board/VstRegisterU");
		}else{
			reservationService.updateVst(bean);
			mv.setViewName("/work/board/retrieveVst.do?vstNo=" + vstNo + "&fromUpdate=true");
		}
		return mv;
	}
	
	
}
