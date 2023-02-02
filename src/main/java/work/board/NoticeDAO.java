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

	public List<Map<String, String>> noticeList(Map<String, String> noticeParam){
		return sqlSession.selectList("notice.noticeList", noticeParam);
	}

	public Map<String, String> noticeView(Map<String, String> noticeParam){
		return sqlSession.selectOne("notice.noticeView", noticeParam);
	}

	public String maxNoticeNo(){
		return sqlSession.selectOne("notice.maxNoticeNo");
	}

	public void noticeWrite(NoticeBean notice){
		sqlSession.insert("notice.noticeWrite", notice);
	}

	public void noticeModify(NoticeBean notice){
		sqlSession.update("notice.noticeModify", notice);
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
