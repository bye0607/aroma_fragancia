package work.board;

import java.util.List;
import java.util.Map;


public interface ReservationService {
	
	public List<Map<String, String>> retrieveVstList(Map<String, String> vstParam);

	public Map<String, String> retrieveVst(Map<String, String> vstParam);

	public String retrieveMaxVstNo();

	public void createVst(ReservationBean vst);

	public void updateVst(ReservationBean vst);

	public void updateVstHits(Map<String, String> vstParam);

	public void deleteVst(Map<String, String> vstParam);
	
	public void deleteVst2(Map<String, String> vstParam);
	
}
