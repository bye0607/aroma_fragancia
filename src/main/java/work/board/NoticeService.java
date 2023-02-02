package work.board;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	public List<Map<String, String>> noticeList(Map<String, String> noticeParam);

	public Map<String, String> noticeView(Map<String, String> noticeParam);

	public String maxNoticeNo();

	public void noticeWrite(NoticeBean notice);

	public void noticeModify(NoticeBean notice);

	public void updateNoticeHit(Map<String, String> noticeParam);

	public void deleteNotice(Map<String, String> noticeParam);
	public void deleteNotice2(Map<String, String> noticeParam);
}
