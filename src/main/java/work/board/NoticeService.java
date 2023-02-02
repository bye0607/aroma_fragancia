package work.board;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	public List<Map<String, String>> retrieveNoticeList(Map<String, String> noticeParam);

	public Map<String, String> retrieveNotice(Map<String, String> noticeParam);

	public String retrieveMaxNoticeNo();

	public void createNotice(NoticeBean notice);

	public void updateNotice(NoticeBean notice);

	public void updateNoticeHit(Map<String, String> noticeParam);

	public void deleteNotice(Map<String, String> noticeParam);
	public void deleteNotice2(Map<String, String> noticeParam);
}
