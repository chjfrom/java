package com.hb.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import com.hb.mybatis.COMENTVO;
import com.hb.mybatis.CVO;
import com.hb.mybatis.DAOImp;
import com.hb.mybatis.MVO;
import com.hb.mybatis.TVO2;
import com.hb.mybatis.VO;

// 자바 1.8이상, 톰켓 Path /로 설정
// 일반 컨트롤러와 달리  jsp와 같은 뷰를 만들어 내지 않음
// 대신 데이터 자체를 반환(단순문자열, json, xml)

@RestController
@RequestMapping("/ajax")
public class MyControllerAjax {
	
	@Inject
	DAOImp dao ;

	public DAOImp getDao() {
		return dao;
	}

	public void setDao(DAOImp dao) {
		this.dao = dao;
	}
	
	// 단순문자인 경우는 브라우저에서 
	// contentType = "text/html" 타입으로 처리한다.
	@RequestMapping(value = "/realController", produces = "application/text; charset=utf8")
	public String realController() throws SQLException {
		String result = "<?xml version='1.0' encoding='UTF-8'?>";
		result += "<members>";
		List<CVO> list = dao.reallist();
		for (CVO k : list) {
			result += "<member>";
			result += "<U_idx>"+k.getU_idx()+"</U_idx>";
			result += "<treade_idx>"+k.getTreade_idx()+"</treade_idx>";
			result += "<introduce>"+k.getEdu_introduce()+"</introduce>";
			result += "<edu_title>"+k.getEdu_title()+"</edu_title>";
			result += "<u_idx>"+k.getU_idx()+"</u_idx>";
			result += "<edu_hit>"+k.getEdu_hit()+"</edu_hit>";
			result += "</member>";
		}
		result+="</members>";
		return result;
	}
	
	@RequestMapping(value = "/todayController", produces = "application/text; charset=utf8")
	public String todayController(HttpServletRequest req) throws SQLException {
		
		String u_idx =  req.getParameter("u_idx");
		String result = "<?xml version='1.0' encoding='UTF-8'?>";
		result += "<members>";
		List<TVO2> list = dao.todaylist(u_idx);
		for (TVO2 k : list) {
			result += "<member>";
			result += "<u_idx>"+k.getU_idx()+"</u_idx>";
			result += "<treade_idx>"+k.getTreade_idx()+"</treade_idx>";
			result += "<introduce>"+k.getEdu_introduce()+"</introduce>";
			result += "</member>";
		}
		result+="</members>";
		return result;
	}
	
	
	@RequestMapping(value = "/modifyUser", produces = "application/text; charset=utf8")
	public String modifyUser(HttpServletRequest req) throws SQLException {
		
		MVO mvo = new MVO();
		mvo.setU_idx(req.getParameter("u_idx"));
		mvo.setU_id(req.getParameter("id"));
		mvo.setU_name(req.getParameter("name"));
		mvo.setU_phon(req.getParameter("phon"));
		mvo.setU_zen(req.getParameter("gen"));
		mvo.setU_edu_name(req.getParameter("edu_name"));
		mvo.setU_mail(req.getParameter("email1")+"@"+req.getParameter("email2"));

		int rt = dao.userUpdate(mvo);
		String rtS = String.valueOf(rt);
		return rtS;
	}
	
	@RequestMapping(value = "/pwChkController", produces = "application/text; charset=utf8")
	public String pwChkController(HttpServletRequest req) throws SQLException {
		String u_idx = req.getParameter("u_idx");
		String pw = req.getParameter("pw");
		Map<String, String> map = new HashMap<>();
		map.put("u_idx", u_idx);
		map.put("pw", pw);
		int result = dao.getPWchk(map);
		String result1 = String.valueOf(result);
		return result1;
	}
	
	
	@RequestMapping(value = "/idChkController", produces = "application/text; charset=utf8")
	public String idChkController(HttpServletRequest req) throws SQLException {
		String u_id = req.getParameter("u_id");
		int result = dao.getIdchk(u_id); 
		String result1 = String.valueOf(result);
		return result1;
	}
	
	@RequestMapping(value = "/ajaxSearch01", produces = "application/text; charset=utf8")
	public String ajaxSearch01(HttpServletRequest req) throws SQLException {
		
		String title_tex =  req.getParameter("title_tex");
		String sch = "<?xml version='1.0' encoding='UTF-8'?>";
		sch += "<members>";
		List<CVO> list = dao.ajaxSearch01(title_tex);
		for (CVO k : list) {
			sch += "<member>";
			sch += "<treade_idx>"+k.getTreade_idx()+"</treade_idx>";
			sch += "<u_idx>"+k.getU_idx()+"</u_idx>";
			sch += "<u_name>"+k.getU_name()+"</u_name>";
			sch += "<edu_title>"+k.getEdu_title()+"</edu_title>";
			sch += "<edu_hit>"+k.getEdu_hit()+"</edu_hit>";
			sch += "<netprofit>"+k.getNetprofit()+"</netprofit>";
			sch += "</member>";
		}
		sch+="</members>";
		return sch;
	}
	
	@RequestMapping(value = "/ajaxSearch02", produces = "application/text; charset=utf8")
	public String ajaxSearch02(HttpServletRequest req) throws SQLException {
		
		String title_tex =  req.getParameter("title_tex");
		String sch = "<?xml version='1.0' encoding='UTF-8'?>";
		sch += "<members>";
		List<CVO> list = dao.ajaxSearch02(title_tex);
		for (CVO k : list) {
			sch += "<member>";
			sch += "<treade_idx>"+k.getTreade_idx()+"</treade_idx>";
			sch += "<u_idx>"+k.getU_idx()+"</u_idx>";
			sch += "<u_name>"+k.getU_name()+"</u_name>";
			sch += "<edu_title>"+k.getEdu_title()+"</edu_title>";
			sch += "<edu_hit>"+k.getEdu_hit()+"</edu_hit>";
			sch += "<netprofit>"+k.getNetprofit()+"</netprofit>";
			sch += "</member>";
		}
		sch+="</members>";
		return sch;
	}
	
	
	@RequestMapping(value = "/ajaxSearch03", produces = "application/text; charset=utf8")
	public String ajaxSearch03(HttpServletRequest req) throws SQLException {
		String[] sel = new String[4];
		sel[0] =  req.getParameter("sel1");
		sel[1] =  req.getParameter("sel2");
		sel[2] =  req.getParameter("sel3");
		sel[3] =  req.getParameter("sel4");
		
		int result = 0;
		for (int i = 0; i < sel.length; i++) {
			if (!sel[i].isEmpty()) {
				result = ++ result;
			} else {
				sel[i] = null;
			}
		}

		String sch = null;
		Map<String, String> map = new HashMap<>();
		map.put("sel1", sel[0]);
		map.put("sel2", sel[1]);
		map.put("sel3", sel[2]);
		map.put("sel4", sel[3]);
		sch = "<?xml version='1.0' encoding='UTF-8'?>";
		sch += "<members>";
		List<CVO> list = dao.AllSch01(map);
		
		/*if (result ==1) {
			list = dao.AllSch01(map);
		} else if (result ==2) {
			list = dao.AllSch02(map);
		} else if (result ==3) {
			list = dao.AllSch03(map);
		} else if (result ==4) {
			list = dao.AllSch04(map);
		}*/
		
		for (CVO k : list) {
			sch += "<member>";
			sch += "<treade_idx>"+k.getTreade_idx()+"</treade_idx>";
			sch += "<u_idx>"+k.getU_idx()+"</u_idx>";
			sch += "<u_name>"+k.getU_name()+"</u_name>";
			sch += "<edu_title>"+k.getEdu_title()+"</edu_title>";
			sch += "<edu_hit>"+k.getEdu_hit()+"</edu_hit>";
			sch += "<netprofit>"+k.getNetprofit()+"</netprofit>";
			sch += "</member>";
		}
		sch+="</members>";
		
		return sch;
	}
	
	
	@RequestMapping(value = "/Comment", produces = "application/text; charset=utf8")
	public String Comment(HttpServletRequest req) throws SQLException {
		
		String treade_idx =  req.getParameter("treade_idx");
		String comment = "<?xml version='1.0' encoding='UTF-8'?>";
		comment += "<members>";
		List<COMENTVO> list = dao.getComent(treade_idx);
		for (COMENTVO k : list) {
			comment += "<member>";
			comment += "<c_idx>"+k.getC_idx()+"</c_idx>";
			comment += "<treade_idx>"+k.getTreade_idx()+"</treade_idx>";
			comment += "<u_idx>"+k.getU_idx()+"</u_idx>";
			comment += "<u_name>"+k.getU_name()+"</u_name>";
			comment += "<c_pwd>"+k.getC_pwd()+"</c_pwd>";
			comment += "<c_content>"+k.getC_content()+"</c_content>";
			comment += "<c_groups>"+k.getC_groups()+"</c_groups>";
			comment += "<Step>"+k.getStep()+"</Step>";
			comment += "<lev>"+k.getLev()+"</lev>";
			comment += "<regdate>"+k.getRegdate().substring(0,16)+"</regdate>";
			comment += "</member>";
		}
		comment+="</members>";
		return comment;
	}
	
	@RequestMapping(value = "/comentAgree", produces = "application/text; charset=utf8")
	public String comentAgree(HttpServletRequest req) throws SQLException {
		
		COMENTVO comentvo = new COMENTVO();
		comentvo.setTreade_idx(req.getParameter("treade_idx"));
		comentvo.setU_idx(req.getParameter("u_idx"));
		comentvo.setU_name(req.getParameter("u_name"));
		comentvo.setC_pwd(req.getParameter("c_pwd"));
		comentvo.setC_content(req.getParameter("c_content"));
		
		String comment = "<?xml version='1.0' encoding='UTF-8'?>";
		comment += "<members>";
		dao.getComentAply(comentvo);
		comment+="</members>";
		return comment;
	}
	
	@RequestMapping(value = "/comentDell", produces = "application/text; charset=utf8")
	public String comentDell(HttpServletRequest req) throws SQLException {
		
		String c_idx =  req.getParameter("c_idx");
		dao.getDell(c_idx);
		String comment = "<?xml version='1.0' encoding='UTF-8'?>";
		comment += "<members>";
		comment+="</members>";
		return comment;
	}
	
	@RequestMapping(value = "/comentModify", produces = "application/text; charset=utf8")
	public String comentModify(HttpServletRequest req) throws SQLException {
		
		String c_idx = req.getParameter("c_idx");
		String c_content = req.getParameter("c_content");
		
		Map<String, String> map = new HashMap<>();
		map.put("c_idx", c_idx);
		map.put("c_content", c_content);
		dao.getModify(map);
		String comment = "<?xml version='1.0' encoding='UTF-8'?>";
		comment += "<members>";
		comment+="</members>";
		return comment;
	}
}






