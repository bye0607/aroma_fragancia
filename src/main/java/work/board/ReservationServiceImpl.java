package work.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("reservationService")
public class ReservationServiceImpl implements ReservationService{
	
	@Resource(name = "reservationDAO")
	private ReservationDAO reservationDAO;
	
	@Override
	public List<Map<String, String>> reservationList(Map<String, String> reservationParam) {
		return reservationDAO.reservationList(reservationParam);
	}
	@Override
	public Map<String, String> reservationView(Map<String, String> reservationParam) {
		return reservationDAO.reservationView(reservationParam);
	}
	@Override
	public String maxReservationNo() {
		return reservationDAO.maxReservationNo();
	}
	@Override
	public void reservationWrite(ReservationBean reservation) {
		reservationDAO.reservationWrite(reservation);	
		
		
	}
	@Override
	public void reservationModify(ReservationBean reservation) {
		reservationDAO.reservationModify(reservation);
		
	}
	@Override
	public void updateReservationHit(Map<String, String> reservationParam) {
		reservationDAO.updateReservationHit(reservationParam);
		
	}
	@Override
	public void deleteReservation(Map<String, String> reservationParam) {
		reservationDAO.deleteReservation(reservationParam);
		
	}
	@Override
	public void deleteReservation2(Map<String, String> reservationParam) {
		reservationDAO.deleteReservation2(reservationParam);
		
	}
	
	

}
