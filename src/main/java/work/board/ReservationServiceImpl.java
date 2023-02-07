package work.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("reservationService")
public class ReservationServiceImpl implements ReservationService{
	
	@Resource(name = "reservationDAO")
	private ReservationDAO reservationDAO;

	public List<Map<String, String>> retrieveVstList(Map<String, String> vstParam){
		return ReservationDAO.retrieveVstList(vstParam);
	}

	public Map<String, String> retrieveVst(Map<String, String> vstParam){
		return ReservationDAO.retrieveVst(vstParam);
	}

	public String retrieveMaxVstNo() {
		return ReservationDAO.retrieveMaxVstNo();
	}
	
	public String retrieveVstNo(){
		return ReservationDAO.retrieveMaxVstNo();
	}

	public void createVst(ReservationBean vst){
		ReservationDAO.createVst(vst);
	}

	public void updateVst(ReservationBean vst){
		ReservationDAO.updateVst(vst);
	}

	public void updateVstHits(Map<String, String> vstParam){
		ReservationDAO.updateVstHits(vstParam);
	}

	

	public void deleteVst(Map<String, String> vstParam) {
		ReservationDAO.deleteVst(vstParam);
		
	}

	public void deleteVst2(Map<String, String> vstParam) {
		ReservationDAO.deleteVst2(vstParam);
		
	}

	

	

}
