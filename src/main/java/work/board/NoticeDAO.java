package work.board;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Map<String, String>> retrieveNoticeList(Map<String, String> noticeParam){
		return sqlSession.selectList("notice.retrieveNoticeList", noticeParam);
	}

	public Map<String, String> retrieveNotice(Map<String, String> noticeParam){
		return sqlSession.selectOne("notice.retrieveNotice", noticeParam);
	}

	public String retrieveMaxNoticeNo(){
		return sqlSession.selectOne("notice.retrieveMaxNoticeNo");
	}

	public void createNotice(NoticeBean notice){
		sqlSession.insert("notice.createNotice", notice);
	}

	public void updateNotice(NoticeBean notice){
		sqlSession.update("notice.updateNotice", notice);
	}

	public void updateNoticeHit(Map<String, String> noticeParam){
		sqlSession.update("notice.updateNoticeHit", noticeParam);
	}

	public void deleteNotice(Map<String, String> noticeParam){
		sqlSession.delete("notice.deleteNotice", noticeParam);
	}

	public void deleteNotice2(Map<String, String> noticeParam){
		sqlSession.delete("notice.deleteNotice2", noticeParam);
	}
}
