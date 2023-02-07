package work.reservation;



import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDAO {
	
	@Autowired
	private static SqlSessionTemplate sqlSession;
//	public static ReservationDAO dao = new ReservationDAO();
	

	public static List<Map<String, String>> retrieveVstList(Map<String, String> vstParam) {
		return sqlSession.selectList("vst.retrieveVstList", vstParam);
	}


	public static Map<String, String> retrieveVst(Map<String, String> vstParam) {
		return sqlSession.selectOne("vst.retrieveVst", vstParam);
	}


	public static String retrieveMaxVstNo() {
		return sqlSession.selectOne("vst.retrieveMaxVstNo");
	}


	public static void createVst(ReservationBean vst) {
		sqlSession.insert("vst.createVst", vst);
		
	}


	public static void updateVst(ReservationBean vst) {
		sqlSession.update("vst.updateVst", vst);
		
	}


	public static void updateVstHits(Map<String, String> vstParam) {
		sqlSession.update("vst.updateVstHits", vstParam);
		
	}


	public static void deleteVst(Map<String, String> vstParam) {
		sqlSession.delete("vst.deleteVst", vstParam);
		
	}
	public static void deleteVst2(Map<String, String> vstParam) {
		sqlSession.delete("vst.deleteVst2", vstParam);
		
	}
}
