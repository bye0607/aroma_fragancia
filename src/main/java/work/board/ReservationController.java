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
public class ReservationController {
	@Resource(name = "reservationService")
	private ReservationService reservationService;

	@Resource(name = "userService")
	private UserService userService;


	@RequestMapping(value="/work/board/reservationWrite.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reservationWrite(@ModelAttribute ReservationBean reservation, HttpServletRequest request){
		HttpSession session = request.getSession();

		String userCode = (String)session.getAttribute("userCode");

		ModelAndView mv = new ModelAndView();

		String flag = reservation.getVstTitle(); //Reservationrst 존재여부
		

		if(flag == null){
			mv.setViewName("/board/reservationWrite");
		}else if(flag != null){
			//게시글 생성
			reservation.setVstRegId(userCode);
			reservationService.reservationWrite(reservation);
			
			//System.out.println("cccccccccccccccccccccccccccccccccccccc");

			String maxReservationNo = reservationService.maxReservationNo();
			
			//System.out.println("ddddddd" + maxReservationNo);

			mv.setViewName("redirect:/work/board/reservationView.do?vstNo=" + maxReservationNo + "&fromCreate=true");
		}

		return mv;
		
		
		
	}
	
	@RequestMapping(value="/work/board/reservation.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String goMain(){
//		ModelAndView mv = new ModelAndView();
//
//		mv.setViewName("/intro/index");

		return "redirect:reservationList.do";
	}

	@RequestMapping(value="/work/board/reservationView.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reservationView(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		String reservationNo = request.getParameter("vstNo");
//		String fromRating = request.getParameter("fromRating");
//		String fromCreate = request.getParameter("fromCreate");
//		String fromReply = request.getParameter("fromReply");

		if(reservationNo == null) reservationNo = request.getParameter("vstNo");

		Map<String, String> reservationParam = new HashMap<String, String>();
		Map<String, String> replyParam = new HashMap<String, String>();

		reservationParam.put("vstNo", reservationNo);
		replyParam.put("vstNo",reservationNo);

//		//조회수 증가
//		if(!"true".equals(fromRating) && !"true".equals(fromCreate) && !"true".equals(fromReply) ){
//			reservationService.updateReservationHit(reservationParam);
//		}

		//System.out.println("aaaaaa" + reservationNo);
		//System.out.println("qqqqQ" + reservationParam);
		
		Map<String, String> dsReservation = reservationService.reservationView(reservationParam);

		//System.out.println("111111111111");
		mv.addObject("dsReservation", dsReservation);

		System.out.println("222222222222");
		
		mv.setViewName("/board/reservationView");
		
		System.out.println("3333333");

		return mv;
	}

	@RequestMapping(value="/work/board/reservationList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reservationList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> reservationParam = new HashMap<String, String>();

		List<Map<String, String>> dsReservationList = reservationService.reservationList(reservationParam);

		mv.addObject("dsreservationList", dsReservationList);
		mv.setViewName("/board/reservationList");

		return mv;
	}

	@RequestMapping(value="/work/board/deleteReservation.do", method=RequestMethod.GET)
	public ModelAndView deleteReservation(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> reservationParam = new HashMap<String, String>();
		Map<String, String> replyParam = new HashMap<String, String>();
		Map<String, String> markParam = new HashMap<String, String>();

		HttpSession session = request.getSession();

		String userCode = (String)session.getAttribute("userCode");
		String reservationNo = request.getParameter("vstNo");

		reservationParam.put("userCode", userCode);
		reservationParam.put("vstNo", reservationNo);

		replyParam.put("vstNo", reservationNo);

		markParam.put("vstNo", reservationNo);

		//글 삭제
		reservationService.deleteReservation(reservationParam);

		mv.setViewName("redirect:/work/board/reservationList.do");

		return mv;
	}

	@RequestMapping(value="/work/board/updateReservationRating.do", method=RequestMethod.GET)
	public ModelAndView updateReservationRating(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, String> reservationParam = new HashMap<String, String>();
		Map<String, String> markParam = new HashMap<String, String>();

		String userCode = (String)session.getAttribute("userCode");
		String reservationNo = request.getParameter("vstNo");

		reservationParam.put("vstNo", reservationNo);

		markParam.put("userCode", userCode);
		markParam.put("vstNo", reservationNo);

		mv.setViewName("redirect:reservationView.do?vstNo=" + reservationNo + "&fromRating=true");

		return mv;
	}

	@RequestMapping(value="/work/board/reservationModify.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reservationModify(HttpServletRequest request, @ModelAttribute ReservationBean bean){
		Map<String, String> reservationParam = new HashMap<String, String>();
				
		ModelAndView mv = new ModelAndView();
		
		
        String reservationNo = request.getParameter("vstNo"); //없으면 GET(create안함), 있으면 POST(create)
       
        String flag = bean.getVstTitle();
        
        reservationParam.put("vstNo", reservationNo);

        System.out.println("111111111111-" + flag);
        
//        System.out.println("2222222222222222-" + reservationParam);

        Map<String, String> dsReservation = reservationService.reservationView(reservationParam);

		if(flag == null){
			
			System.out.println("333333333333-" + dsReservation);
			
			mv.addObject("dsReservation", dsReservation);
			mv.setViewName("/board/reservationModify");
		}else{
			
			 System.out.println("44444444-" + reservationNo);
			 System.out.println("555-" + bean.getVstTitle());
			 System.out.println("666-" + bean.getVstContent());
			 System.out.println("777-" + bean.getVstNo());
			 System.out.println("877-" + bean.getVstPhone());
			 System.out.println("977-" + bean.getVstEmail());			 
			 
			reservationService.reservationModify(bean);
			mv.setViewName("/work/board/reservationView.do?vstNo=" + reservationNo + "&fromUpdate=true");
		}
		return mv;
	}


}
