package work.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Map<String, String>> reservationList(Map<String, String> reservationParam){
		return sqlSession.selectList("reservation.reservationList", reservationParam);
	}

	public Map<String, String> reservationView(Map<String, String> reservationParam){
		return sqlSession.selectOne("reservation.reservationView", reservationParam);
	}

	public String maxReservationNo(){
		return sqlSession.selectOne("reservation.maxReservationNo");
	}

	public void reservationWrite(ReservationBean reservation){
		sqlSession.insert("reservation.reservationWrite", reservation);
	}
	
	public void reservationModify(ReservationBean reservation){
		sqlSession.update("reservation.reservationModify", reservation);
	}

	public void updateReservationHit(Map<String, String> reservationParam){
		sqlSession.update("reservation.updateReservationHit", reservationParam);
	}
	


	public void deleteReservation(Map<String, String> reservationParam){
		sqlSession.delete("reservation.deleteReservation", reservationParam);
	}

	public void deleteReservation2(Map<String, String> reservationParam){
		sqlSession.delete("reservation.deleteReservation2", reservationParam);
	}
}