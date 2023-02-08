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
public class CommunityController {
	@Resource(name = "communityService")
	private CommunityService communityService;

	@Resource(name = "userService")
	private UserService userService;


	@RequestMapping(value="/work/board/communityWrite.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView communityWrite(@ModelAttribute CommunityBean community, HttpServletRequest request){
		HttpSession session = request.getSession();

		String userCode = (String)session.getAttribute("userCode");

		ModelAndView mv = new ModelAndView();

		String flag = community.getComuTitle(); //CommunityBean 존재여부

		if(flag == null){
			mv.setViewName("/board/communityWrite");
		}else if(flag != null){
			//게시글 생성
			community.setComuRegId(userCode);
			communityService.communityWrite(community);

			String maxCommunitydNo = communityService.maxCommunityNo();

			mv.setViewName("redirect:/work/board/communityView.do?maxCommunityNo=" + maxCommunitydNo + "&fromCreate=true");
		}

		return mv;
	}
	
	@RequestMapping(value="/work/board/community.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String goMain(){
//		ModelAndView mv = new ModelAndView();
//
//		mv.setViewName("/intro/index");

		return "redirect:/work/board/communityList.do";
	}

	@RequestMapping(value="/work/board/communityView.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView communityView(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		String communityNo = request.getParameter("maxCommunityNo");
		String fromRating = request.getParameter("fromRating");
		String fromCreate = request.getParameter("fromCreate");
		String fromReply = request.getParameter("fromReply");

		if(communityNo == null) communityNo = request.getParameter("comuNo");

		Map<String, String> communityParam = new HashMap<String, String>();
		Map<String, String> replyParam = new HashMap<String, String>();

		communityParam.put("comuNo", communityNo);
		replyParam.put("comuNo", communityNo);

		//조회수 증가
		if(!"true".equals(fromRating) && !"true".equals(fromCreate) && !"true".equals(fromReply) ){
			communityService.updateCommunityHit(communityParam);
		}

		Map<String, String> dsCommunity = communityService.communityView(communityParam);


		mv.addObject("dsCommunity", dsCommunity);

		mv.setViewName("/board/communityView");

		return mv;
	}

	@RequestMapping(value="/work/board/communityList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView communityList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> communityParam = new HashMap<String, String>();

		List<Map<String, String>> dsCommunityList = communityService.communityList(communityParam);

		mv.addObject("dsCommunityList", dsCommunityList);
		mv.setViewName("/board/communityList");

		return mv;
	}

	@RequestMapping(value="/work/board/deleteCommunity.do", method=RequestMethod.GET)
	public ModelAndView deleteCommunity(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> communityParam = new HashMap<String, String>();
		Map<String, String> replyParam = new HashMap<String, String>();
		Map<String, String> markParam = new HashMap<String, String>();

		HttpSession session = request.getSession();

		String userCode = (String)session.getAttribute("userCode");
		String communityNo = request.getParameter("comuNo");

		communityParam.put("userCode", userCode);
		communityParam.put("comuNo", communityNo);

		replyParam.put("comuNo", communityNo);

		markParam.put("comuNo", communityNo);

		//글 삭제
		communityService.deleteCommunity(communityParam);

		mv.setViewName("redirect:/work/board/communityList.do");

		return mv;
	}

	@RequestMapping(value="/work/board/updateCommunityRating.do", method=RequestMethod.GET)
	public ModelAndView updateCommunityRating(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, String> communityParam = new HashMap<String, String>();
		Map<String, String> markParam = new HashMap<String, String>();

		String userCode = (String)session.getAttribute("userCode");
		String communityNo = request.getParameter("comuNo");

		communityParam.put("comuNo", communityNo);

		markParam.put("userCode", userCode);
		markParam.put("comuNo", communityNo);

		mv.setViewName("redirect:/work/board/communityView.do?comuNo=" + communityNo + "&fromRating=true");

		return mv;
	}

	@RequestMapping(value="/work/board/communityModify.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView communityModify(HttpServletRequest request, @ModelAttribute CommunityBean bean){
		Map<String, String> communityParam = new HashMap<String, String>();
		ModelAndView mv = new ModelAndView();
        String communityNo = request.getParameter("comuNo"); //없으면 GET(create안함), 있으면 POST(create)

        String flag = bean.getComuTitle();
        communityParam.put("comuNo", communityNo);

        Map<String, String> dsCommunity = communityService.communityView(communityParam);

		if(flag == null){
			mv.addObject("dsCommunity", dsCommunity);
			mv.setViewName("/board/communityModify");
		}else{
			communityService.communityModify(bean);
			mv.setViewName("/work/board/communityView.do?comuNo=" + communityNo + "&fromUpdate=true");
		}
		return mv;
	}

}
