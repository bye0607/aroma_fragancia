package work.board;

import java.util.List;
import java.util.Map;

public interface ReservationService {
		public List<Map<String, String>> reservationList(Map<String, String> reservationParam);

		public Map<String, String> reservationView(Map<String, String> reservationParam);

		public String maxReservationNo();

		public void reservationWrite(ReservationBean reservation);

		public void reservationModify(ReservationBean reservation);

		public void updateReservationHit(Map<String, String> reservationParam);

		public void deleteReservation(Map<String, String> reservationParam);
		
		public void deleteReservation2(Map<String, String> reservationParam);

}