package com.hb.mybatis;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class DAOImp implements DAO{
	
	@Inject
	private SqlSessionTemplate template ;

	public void setTemplate(SqlSessionTemplate template) {
		this.template = template;
	}
	
	@Override
	public List<CVO> getIndex(Map map) throws SQLException {
		return template.selectList("list", map);
	}
	
	@Override
	public int getTotalCount() throws SQLException {
		return template.selectOne("totalcount");
	}

	@Override
	public List<CVO> getBestList() throws SQLException {
		return template.selectList("best_list");
	}

	@Override
	public TVO getTodayCheck(Map map) throws SQLException {
		return template.selectOne("todayCheck", map);
	}

	@Override
	public void getTodayInsert(Map map) throws SQLException {
		template.insert("todayInsert", map);
	}

	@Override
	public List<IVO> getCheck(Map map) throws SQLException {
		return template.selectList("CheckI", map);
	}
	
	@Override
	public CVO getOneList(String viewNum) throws SQLException {
		return template.selectOne("viewlist", viewNum);
	}

	@Override
	public void getHitUp(CVO cvo) throws SQLException {
		template.update("hitup", cvo);
	}

	@Override
	public MVO getLogin(MVO vo) throws SQLException {
		MVO Rvo = null;
		return Rvo = template.selectOne("login", vo);
	}

	@Override
	public int getTinsert(CVO cvo) throws SQLException {
		int result;
		return result = template.insert("t_insert", cvo);
	}
	
	@Override
	public List<CVO> reallist() throws SQLException {
		return template.selectList("reallist");
	}

	@Override
	public List<TVO2> todaylist(String u_idx) throws SQLException {
		return template.selectList("todaylist", u_idx);
	}

	@Override
	public List<CVO> getInterestList(Map map) throws SQLException {
		return template.selectList("Interestlist", map);
	}

	@Override
	public int userUpdate(MVO mvo) throws SQLException {
		return template.update("user_Update", mvo);
	}
	
	@Override
	public int getPWchk(Map map) throws SQLException {
		 List<MVO> list = template.selectList("pwChk", map);
		 int result = 0;
		 if (list.size() > 0) {
			 result = 1;
		 }
		return result;
	}
	
	@Override
	public int getIdchk(String u_id) throws SQLException {
		 List<MVO> list = template.selectList("IDChk", u_id);
		 int result = 0;
		 if (list.size() > 0) {
			 result = 1;
		 } 
		return result;
	}

	@Override
	public void getInsert(MVO mvo) throws SQLException {
		template.insert("insert", mvo);
	}

	@Override
	public int getBinsert(BVO bvo) throws SQLException {
		int result;
		return result = template.insert("b_insert", bvo);
	}

	@Override
	public List<BVO> getIndex1() throws SQLException {
		return template.selectList("buylist");
	}

	@Override
	public List<BVO> getIndex2(String more) throws SQLException {
		return template.selectList("buylist_more",more);
	}

	@Override
	public int getBuyCount() throws SQLException {
		return template.selectOne("buyTotalcount");
	}

	@Override
	public List<CVO> ajaxSearch01(String title_tex) throws SQLException {
		return template.selectList("numesch", title_tex);
	}

	@Override
	public List<CVO> ajaxSearch02(String title_tex) throws SQLException {
		return template.selectList("titlesch", title_tex);
	}

	@Override
	public List<CVO> AllSch01(Map map) throws SQLException {
		return template.selectList("select01", map);
	}
	
	@Override
	public List<CVO> AllSch02(Map map) throws SQLException {
		return template.selectList("select02", map);
	}
	
	@Override
	public List<CVO> AllSch03(Map map) throws SQLException {
		return template.selectList("select03", map);
	}
	
	@Override
	public List<CVO> AllSch04(Map map) throws SQLException {
		return template.selectList("select04", map);
	}

	@Override
	public void getdateup(DVO dvo) throws SQLException {
		template.insert("d_insert", dvo);
	}

	@Override
	public List<DVO> getdatalist() throws SQLException {
		return template.selectList("datalist");
	}
	
	@Override
	public List<DVO> getdatalist(String more) throws SQLException {
		return template.selectList("datalist1",more);
	}

	@Override
	public DVO getdataOne(String data_idx) throws SQLException {
		return template.selectOne("dataone", data_idx);
	}

	@Override
	public DVO getdatabefore(int before_idx) throws SQLException {
		return template.selectOne("datbefore", before_idx);
	}
	
	@Override
	public DVO getdataafter(int after_idx) throws SQLException {
		return template.selectOne("afterlist", after_idx);
	}

	@Override
	public List<DVO> getr_numlist(String r_num) throws SQLException {
		return template.selectList("r_numlist", r_num);
	}

	@Override
	public void getDHitUp(DVO dvo) throws SQLException {
		template.update("hitupD", dvo);
	}

	@Override
	public int getDateCount() throws SQLException {
		return template.selectOne("Datacount");
	}

	@Override
	public List<COMENTVO> getComent(String treade_idx) throws SQLException {
		return template.selectList("commentlist", treade_idx);
	}

	@Override
	public void getComentAply(COMENTVO comentvo) throws SQLException {
		template.insert("commentwrite", comentvo);
	}

	@Override
	public void getDell(String c_idx) throws SQLException {
		template.delete("commentDel", c_idx);
	}

	@Override
	public void getModify(Map map) throws SQLException {
		template.update("commentmodify", map);
	}

	@Override
	public List<CVO> getIndexH(Map map) throws SQLException {
		return template.selectList("listH", map);
	}

	@Override
	public List<CVO> getIndexL(Map map) throws SQLException {
		return template.selectList("listL", map);
	}
}
