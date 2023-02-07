package work.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("CommunityService")
public class CommunityServiceImpl implements CommunityService{
	
	@Resource(name = "CommunityDAO")
	private CommunityDAO communityDAO;


	@Override
	public List<Map<String, String>> communityList(Map<String, String> communityParam) {
		return communityDAO.communityList(communityParam);
	}

	@Override
	public Map<String, String> communityView(Map<String, String> communityParam) {
		return communityDAO.communityView(communityParam);
	}

	@Override
	public String MaxCommunityNo() {
		return communityDAO.MaxCommunityNo();
	}

	@Override
	public void communityWrite(CommunityBean community) {
		communityDAO.communityWrite(community);
		
	}

	@Override
	public void communityModify(CommunityBean community) {
		communityDAO.communityModify(community);
		
	}

	@Override
	public void updateCommunityHit(Map<String, String> communityParam) {
		communityDAO.updateCommunityHit(communityParam);
		
	}

	@Override
	public void deleteCommunity(Map<String, String> communityParam) {
		communityDAO.deleteCommunity(communityParam);
		
	}

	@Override
	public void deleteCommunity2(Map<String, String> communityParam) {
		communityDAO.deleteCommunity2(communityParam);
		
	}
	
}