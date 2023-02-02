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
	public List<Map<String, String>> retrieveNoticeList(Map<String, String> noticeParam) {
		return noticeDAO.retrieveNoticeList(noticeParam);
	}

	@Override
	public Map<String, String> retrieveNotice(Map<String, String> noticeParam) {
		return noticeDAO.retrieveNotice(noticeParam);
	}

	@Override
	public String retrieveMaxNoticeNo() {
		return noticeDAO.retrieveMaxNoticeNo();
	}

	@Override
	public void createNotice(NoticeBean notice) {
		noticeDAO.createNotice(notice);		
	}

	@Override
	public void updateNotice(NoticeBean notice) {
		noticeDAO.updateNotice(notice);
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
