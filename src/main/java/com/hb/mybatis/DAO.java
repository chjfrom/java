package com.hb.mybatis;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface DAO {
	
	public List<CVO> getIndex(Map map) throws SQLException;
	public List<CVO> getIndexH(Map map) throws SQLException;
	public List<CVO> getIndexL(Map map) throws SQLException;
	public List<BVO> getIndex1() throws SQLException;
	public List<BVO> getIndex2(String more) throws SQLException;
	public int getTotalCount() throws SQLException;
	public int getBuyCount() throws SQLException;
	public List<CVO> getBestList() throws SQLException;
	public TVO getTodayCheck (Map map) throws SQLException;
	public void getTodayInsert (Map map) throws SQLException;
	public List<IVO> getCheck(Map map) throws SQLException;
	public CVO getOneList(String viewNum) throws SQLException;
	public void getHitUp(CVO cvo) throws SQLException;
	public MVO getLogin(MVO vo) throws SQLException;
	public int getTinsert(CVO cvo) throws SQLException;
	public int getBinsert(BVO bvo) throws SQLException;
	public List<CVO> reallist() throws SQLException;
	public List<TVO2> todaylist (String u_idx) throws SQLException;
	public List<CVO> getInterestList(Map map) throws SQLException;
	public int userUpdate(MVO mvo) throws SQLException;
	public int getPWchk(Map map) throws SQLException;
	public int getIdchk(String u_id) throws SQLException;
	public void getInsert(MVO mvo) throws SQLException;
	public List<CVO> ajaxSearch01(String title_tex) throws SQLException;
	public List<CVO> ajaxSearch02(String title_tex) throws SQLException;
	public void getdateup(DVO dvo) throws SQLException;
	public List<DVO> getdatalist() throws SQLException;
	public List<DVO> getdatalist(String more) throws SQLException;
	public DVO getdataOne(String data_idx) throws SQLException;
	public DVO getdatabefore(int before_idx) throws SQLException;
	public DVO getdataafter(int after_idx) throws SQLException;
	public List<DVO> getr_numlist (String r_num) throws SQLException;
	public void getDHitUp (DVO dvo) throws SQLException;
	public int getDateCount() throws SQLException;
	public List<CVO> AllSch01(Map map) throws SQLException;
	public List<CVO> AllSch02(Map map) throws SQLException;
	public List<CVO> AllSch03(Map map) throws SQLException;	
	public List<CVO> AllSch04(Map map) throws SQLException;
	public List<COMENTVO> getComent(String treade_idx) throws SQLException;
	public void getComentAply(COMENTVO comentvo) throws SQLException;
	public void getDell(String c_idx) throws SQLException;
	public void getModify(Map map) throws SQLException;
	
}
