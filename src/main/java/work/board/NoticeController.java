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
public class NoticeController {
	@Resource(name = "noticeService")
	private NoticeService noticeService;

	@Resource(name = "userService")
	private UserService userService;


	@RequestMapping(value="/work/board/createNotice.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView createNotice(@ModelAttribute NoticeBean notice, HttpServletRequest request){
		HttpSession session = request.getSession();

		String userCode = (String)session.getAttribute("userCode");

		ModelAndView mv = new ModelAndView();

		String flag = notice.getNtcTitle(); //NoticeBean 존재여부

		if(flag == null){
			mv.setViewName("/board/noticeWrite");
		}else if(flag != null){
			//게시글 생성
			notice.setNtcRegId(userCode);
			noticeService.createNotice(notice);

			String maxNoticedNo = noticeService.retrieveMaxNoticeNo();

			mv.setViewName("redirect:/work/board/retrieveNotice.do?maxNoticeNo=" + maxNoticedNo + "&fromCreate=true");
		}

		return mv;
	}
	
	@RequestMapping(value="/work/board/notice.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String goMain(){
//		ModelAndView mv = new ModelAndView();
//
//		mv.setViewName("/intro/index");

		return "redirect:/work/board/retrieveNoticeList.do";
	}

	@RequestMapping(value="/work/board/retrieveNotice.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView retrieveNotice(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		String noticeNo = request.getParameter("maxNoticeNo");
		String fromRating = request.getParameter("fromRating");
		String fromCreate = request.getParameter("fromCreate");
		String fromReply = request.getParameter("fromReply");

		if(noticeNo == null) noticeNo = request.getParameter("ntcNo");

		Map<String, String> noticeParam = new HashMap<String, String>();
		Map<String, String> replyParam = new HashMap<String, String>();

		noticeParam.put("ntcNo", noticeNo);
		replyParam.put("ntcNo", noticeNo);

		//조회수 증가
		if(!"true".equals(fromRating) && !"true".equals(fromCreate) && !"true".equals(fromReply) ){
			noticeService.updateNoticeHit(noticeParam);
		}

		Map<String, String> dsNotice = noticeService.retrieveNotice(noticeParam);


		mv.addObject("dsNotice", dsNotice);

		mv.setViewName("/board/noticeView");

		return mv;
	}

	@RequestMapping(value="/work/board/retrieveNoticeList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView retrieveNoticeList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> noticeParam = new HashMap<String, String>();

		List<Map<String, String>> dsNoticeList = noticeService.retrieveNoticeList(noticeParam);

		mv.addObject("dsNoticeList", dsNoticeList);
		mv.setViewName("/board/noticeList");

		return mv;
	}

	@RequestMapping(value="/work/board/deleteNotice.do", method=RequestMethod.GET)
	public ModelAndView deleteNotice(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> noticeParam = new HashMap<String, String>();
		Map<String, String> replyParam = new HashMap<String, String>();
		Map<String, String> markParam = new HashMap<String, String>();

		HttpSession session = request.getSession();

		String userCode = (String)session.getAttribute("userCode");
		String noticeNo = request.getParameter("ntcNo");

		noticeParam.put("userCode", userCode);
		noticeParam.put("ntcNo", noticeNo);

		replyParam.put("ntcNo", noticeNo);

		markParam.put("ntcNo", noticeNo);

		//글 삭제
		noticeService.deleteNotice(noticeParam);

		mv.setViewName("redirect:/work/board/retrieveNoticeList.do");

		return mv;
	}

	@RequestMapping(value="/work/board/updateNoticeRating.do", method=RequestMethod.GET)
	public ModelAndView updateNoticeRating(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, String> noticeParam = new HashMap<String, String>();
		Map<String, String> markParam = new HashMap<String, String>();

		String userCode = (String)session.getAttribute("userCode");
		String noticeNo = request.getParameter("ntcNo");

		noticeParam.put("ntcNo", noticeNo);

		markParam.put("userCode", userCode);
		markParam.put("ntcNo", noticeNo);

		mv.setViewName("redirect:/work/board/retrieveNotice.do?ntcNo=" + noticeNo + "&fromRating=true");

		return mv;
	}

	@RequestMapping(value="/work/board/updateNotice.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateNotice(HttpServletRequest request, @ModelAttribute NoticeBean bean){
		Map<String, String> noticeParam = new HashMap<String, String>();
		ModelAndView mv = new ModelAndView();
        String noticeNo = request.getParameter("ntcNo"); //없으면 GET(create안함), 있으면 POST(create)

        String flag = bean.getNtcTitle();
        noticeParam.put("ntcNo", noticeNo);

        Map<String, String> dsNotice = noticeService.retrieveNotice(noticeParam);

		if(flag == null){
			mv.addObject("dsNotice", dsNotice);
			mv.setViewName("/board/noticeModify");
		}else{
			noticeService.updateNotice(bean);
			mv.setViewName("/work/board/retrieveNotice.do?ntcNo=" + noticeNo + "&fromUpdate=true");
		}
		return mv;
	}

}
