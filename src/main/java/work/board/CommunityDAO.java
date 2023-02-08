package work.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommunityDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Map<String, String>> communityList(Map<String, String> communityParam){
		return sqlSession.selectList("community.communityList", communityParam);
	}

	public Map<String, String> communityView(Map<String, String> communityParam){
		return sqlSession.selectOne("community.communityView", communityParam);
	}

	public String maxCommunityNo(){
		return sqlSession.selectOne("community.maxCommunityNo");
	}

	public void communityWrite(CommunityBean community){
		sqlSession.insert("community.communityWrite", community);
	}

	public void communityModify(CommunityBean community){
		sqlSession.update("community.communityModify", community);
	}

	public void updateCommunityHit(Map<String, String> communityParam){
		sqlSession.update("community.updateCommunityHit", communityParam);
	}

	public void deleteCommunity(Map<String, String> communityParam){
		sqlSession.delete("community.deleteCommunity", communityParam);
	}

	public void deleteCommunity2(Map<String, String> communityParam){
		sqlSession.delete("community.deleteCommunity2", communityParam);
	}
}
