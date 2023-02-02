package work.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Resource(name = "noticeDAO")
	private NoticeDAO noticeDAO;
	
	@Override
	public List<Map<String, String>> noticeList(Map<String, String> noticeParam) {
		return noticeDAO.noticeList(noticeParam);
	}

	@Override
	public Map<String, String> noticeView(Map<String, String> noticeParam) {
		return noticeDAO.noticeView(noticeParam);
	}

	@Override
	public String maxNoticeNo() {
		return noticeDAO.maxNoticeNo();
	}

	@Override
	public void noticeWrite(NoticeBean notice) {
		noticeDAO.noticeWrite(notice);		
	}

	@Override
	public void noticeModify(NoticeBean notice) {
		noticeDAO.noticeModify(notice);
	}

	@Override
	public void updateNoticeHit(Map<String, String> noticeParam) {
		noticeDAO.updateNoticeHit(noticeParam);
	}

	@Override
	public void deleteNotice(Map<String, String> noticeParam) {
		noticeDAO.deleteNotice(noticeParam);
	}

	@Override
	public void deleteNotice2(Map<String, String> noticeParam) {
		noticeDAO.deleteNotice2(noticeParam);
	}

}
