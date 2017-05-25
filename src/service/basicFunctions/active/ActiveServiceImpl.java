package service.basicFunctions.active;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import common.helper.StringUtil;
import database.basicFunctions.dao.active.ActiveDao;
import database.common.OrderFilter.OrderType;
import database.common.SearchFilter.Operators;
import database.common.PageDataList;
import database.common.QueryParam;
import database.models.active.Active;

@Service("activeService")
public class ActiveServiceImpl implements ActiveService{

	@Autowired
	private ActiveDao activeDao; 
	

	public Active save(Active active) {
		return activeDao.save(active);
	}
	

	@Override
	public Active find(int id) {
		return activeDao.find(id);
	}
	
	public void update(Active active) {
		activeDao.update(active);
	}

	public List<Active> findByHql(String hql) {
		return activeDao.findByHql(hql);
	}

	public void delete(Integer id) {
		activeDao.delete(id);
	}
	
	public PageDataList<Active> loadDataByPage(int currentPage,String key,String searchType){
		QueryParam queryParam=QueryParam.getInstance();
		queryParam.addPage(currentPage);
		if(StringUtil.isNotBlank(searchType)){
			queryParam.addParam("type", searchType);
		}
		if(StringUtil.isNotBlank(key)){
			queryParam.addParam("name",Operators.LIKE, key);
		}
		queryParam.addOrder(OrderType.DESC,"addTime");
		return activeDao.findPageList(queryParam);
	}



}
