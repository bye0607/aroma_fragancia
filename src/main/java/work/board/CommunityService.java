package work.board;

import java.util.List;
import java.util.Map;

public interface CommunityService {
		public List<Map<String, String>> communityList(Map<String, String> communityParam);

		public Map<String, String> communityView(Map<String, String> communityParam);

		public String maxCommunityNo();

		public void communityWrite(CommunityBean community);

		public void communityModify(CommunityBean community);

		public void updateCommunityHit(Map<String, String> communityParam);

		public void deleteCommunity(Map<String, String> communityParam);
		
		public void deleteCommunity2(Map<String, String> communityParam);
}
