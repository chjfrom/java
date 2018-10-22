package com.hb.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hb.mybatis.BVO;
import com.hb.mybatis.CVO;
import com.hb.mybatis.DAO;
import com.hb.mybatis.DAOImp;
import com.hb.mybatis.DVO;
import com.hb.mybatis.IVO;
import com.hb.mybatis.MVO;
import com.hb.mybatis.Paging;
import com.hb.mybatis.TVO;
import com.hb.mybatis.VO;



@Controller
public class MyController {
	
	@Inject
	DAOImp dao ;

	public DAOImp getDao() {
		return dao;
	}

	public void setDao(DAOImp dao) {
		this.dao = dao;
	}
	@RequestMapping("/login.do")
	public ModelAndView getLogin(HttpServletRequest req,HttpServletResponse res) {
		ModelAndView mv = new ModelAndView("login");
		return mv;
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView getLogout(HttpServletRequest req,HttpServletResponse res) {
		ModelAndView mv = new ModelAndView("login");
		req.getSession().invalidate();
		return new ModelAndView("redirect:/index.do");
	}
	
	@RequestMapping("/LoginSign.do")
	public ModelAndView getLoginSign(HttpServletRequest req,HttpServletResponse res) throws SQLException {
		
		MVO vo = new MVO();
		vo.setU_id(req.getParameter("id"));
		vo.setU_pass(req.getParameter("pw"));
		
		HttpSession session = req.getSession();
		// DB처리 <=> DAO클래스 <=> mapper.xml <=> DB
		MVO mvo = dao.getLogin(vo);		
		// 로그인 실패
		if (mvo == null) {
			session.setAttribute("login_chk", false);
			return new ModelAndView("redirect:/index.do");
		} else { // 성공
			session.setAttribute("login_chk", true);
			// 로그인 처리는 기본적으로 세션으로
			session.setAttribute("mvo", mvo);
			return new ModelAndView("redirect:/index.do");
		}
	}


	@RequestMapping("/index.do")
	public ModelAndView getIndex(HttpServletRequest req,HttpServletResponse res) {
		ModelAndView mv = new ModelAndView("index");
		
		Paging pvo = new Paging();
		// 1. 전체 게시물의 수 구하기
		try {
			pvo.setTotalRecord(dao.getTotalCount());
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 
		
		// 2. 전체 페이지의 수 구하기
		pvo.seteTotalPage();
		
		// 3. 현재 페이지를 구하기
		String cPage = req.getParameter("cPage");
		if(cPage!= null) {
			// null이 아니면 cPage가 nowPage가 된다. 
			pvo.setNowPage(Integer.parseInt(cPage));
		}
		// null 이면 그냥 pvo에 존재하는 nowPage사용하면 된다.
		
		// 4. 각 페이지의 시작번호와 끝번호 구하기
		pvo.setBegin((pvo.getNowPage()-1)*pvo.getNumPerPage()+1);
		pvo.setEnd((pvo.getBegin()-1)+pvo.getNumPerPage());
		
		// 5.시작번호와 끝번호를 이용해서 select문 실행
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", pvo.getBegin());
		map.put("end", pvo.getEnd());
		
		// 6. 블록시작번호와 블록끝번호를 구하자
		pvo.setBeginPage(((pvo.getNowPage()-1)/pvo.getPagePerBlock())*pvo.getPagePerBlock()+1);
		pvo.setEndPage(pvo.getBeginPage()+pvo.getPagePerBlock()-1);	
		// 주의 사항 : endPage가 totalPage보다 클 경우 존재
	    //            endPage을 totalPage에 맞춘다.
		if(pvo.getEndPage() > pvo.getTotalPage()) {
			pvo.setEndPage(pvo.getTotalPage());
		}	
		// 베스트 매물 
		try {
			List<CVO> best_list = dao.getBestList();
			mv.addObject("best_list", best_list);
		} catch (SQLException e1) {
		}
		try {
			List<CVO> list = dao.getIndex(map);
			mv.addObject("list", list);
		} catch (SQLException e) {
		}
		mv.addObject("pvo", pvo);
		mv.addObject("cPage", cPage);
		return mv;
	}
	
	
	@RequestMapping("/indexH.do")
	public ModelAndView getIndexH(HttpServletRequest req,HttpServletResponse res) {
		ModelAndView mv = new ModelAndView("index");
		
		Paging pvo = new Paging();
		// 1. 전체 게시물의 수 구하기
		try {
			pvo.setTotalRecord(dao.getTotalCount());
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 
		
		// 2. 전체 페이지의 수 구하기
		pvo.seteTotalPage();
		
		// 3. 현재 페이지를 구하기
		String cPage = req.getParameter("cPage");
		if(cPage!= null) {
			// null이 아니면 cPage가 nowPage가 된다. 
			pvo.setNowPage(Integer.parseInt(cPage));
		}
		// null 이면 그냥 pvo에 존재하는 nowPage사용하면 된다.
		
		// 4. 각 페이지의 시작번호와 끝번호 구하기
		pvo.setBegin((pvo.getNowPage()-1)*pvo.getNumPerPage()+1);
		pvo.setEnd((pvo.getBegin()-1)+pvo.getNumPerPage());
		
		// 5.시작번호와 끝번호를 이용해서 select문 실행
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", pvo.getBegin());
		map.put("end", pvo.getEnd());
		
		// 6. 블록시작번호와 블록끝번호를 구하자
		pvo.setBeginPage(((pvo.getNowPage()-1)/pvo.getPagePerBlock())*pvo.getPagePerBlock()+1);
		pvo.setEndPage(pvo.getBeginPage()+pvo.getPagePerBlock()-1);	
		// 주의 사항 : endPage가 totalPage보다 클 경우 존재
	    //            endPage을 totalPage에 맞춘다.
		if(pvo.getEndPage() > pvo.getTotalPage()) {
			pvo.setEndPage(pvo.getTotalPage());
		}	
		// 베스트 매물 
		try {
			List<CVO> best_list = dao.getBestList();
			mv.addObject("best_list", best_list);
		} catch (SQLException e1) {
		}
		String h_price = "h_price";
		try {
			List<CVO> list = dao.getIndexH(map);
			mv.addObject("list", list);
		} catch (SQLException e) {
		}
		mv.addObject("pvo", pvo);
		mv.addObject("cPage", cPage);
		mv.addObject("h_price", h_price);
		return mv;
	}
	
	@RequestMapping("/indexL.do")
	public ModelAndView getIndexL(HttpServletRequest req,HttpServletResponse res) {
		ModelAndView mv = new ModelAndView("index");
		
		Paging pvo = new Paging();
		// 1. 전체 게시물의 수 구하기
		try {
			pvo.setTotalRecord(dao.getTotalCount());
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 
		
		// 2. 전체 페이지의 수 구하기
		pvo.seteTotalPage();
		
		// 3. 현재 페이지를 구하기
		String cPage = req.getParameter("cPage");
		if(cPage!= null) {
			// null이 아니면 cPage가 nowPage가 된다. 
			pvo.setNowPage(Integer.parseInt(cPage));
		}
		// null 이면 그냥 pvo에 존재하는 nowPage사용하면 된다.
		
		// 4. 각 페이지의 시작번호와 끝번호 구하기
		pvo.setBegin((pvo.getNowPage()-1)*pvo.getNumPerPage()+1);
		pvo.setEnd((pvo.getBegin()-1)+pvo.getNumPerPage());
		
		// 5.시작번호와 끝번호를 이용해서 select문 실행
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", pvo.getBegin());
		map.put("end", pvo.getEnd());
		
		// 6. 블록시작번호와 블록끝번호를 구하자
		pvo.setBeginPage(((pvo.getNowPage()-1)/pvo.getPagePerBlock())*pvo.getPagePerBlock()+1);
		pvo.setEndPage(pvo.getBeginPage()+pvo.getPagePerBlock()-1);	
		// 주의 사항 : endPage가 totalPage보다 클 경우 존재
	    //            endPage을 totalPage에 맞춘다.
		if(pvo.getEndPage() > pvo.getTotalPage()) {
			pvo.setEndPage(pvo.getTotalPage());
		}	
		// 베스트 매물 
		try {
			List<CVO> best_list = dao.getBestList();
			mv.addObject("best_list", best_list);
		} catch (SQLException e1) {
		}
		String L_price = "L_price";
		try {
			List<CVO> list = dao.getIndexL(map);
			mv.addObject("list", list);
		} catch (SQLException e) {
		}
		mv.addObject("pvo", pvo);
		mv.addObject("cPage", cPage);
		mv.addObject("L_price", L_price);
		return mv;
	}
	
	@RequestMapping("/buylist.do")
	public ModelAndView getbylist(HttpServletRequest req,HttpServletResponse res) {
		ModelAndView mv = new ModelAndView("index2");
		try {
			List<BVO> list = dao.getIndex1();
			mv.addObject("list", list);
		} catch (SQLException e) {
		}
		return mv;
	}
	
	@RequestMapping("/buylistNum.do")
	public ModelAndView getbylistNum(HttpServletRequest req,HttpServletResponse res) {	
		ModelAndView mv = new ModelAndView("index2");
		String more = req.getParameter("more");
		try {
			List<BVO> list = dao.getIndex2(more);
			int count = dao.getBuyCount();
			mv.addObject("list", list);
			mv.addObject("more", more);
			mv.addObject("count", count);
		} catch (SQLException e) {
		}
		return mv;
	}
	
	
	@RequestMapping("/listView.do")
	public ModelAndView getlistView(HttpServletRequest req,HttpServletResponse res) throws SQLException {
		ModelAndView mv = new ModelAndView("list_view01");
		String viewNum = req.getParameter("viewNum");
		String u_idx = req.getParameter("u_idx");
		Map<String, String> map = new HashMap<>();
		map.put("u_idx", u_idx);
		map.put("treade_idx", viewNum);
		
		// 오늘 방문한 매물 페이지
		if (u_idx != "") {
			TVO tlist = dao.getTodayCheck(map);
			if (tlist == null) {
				dao.getTodayInsert(map);
			}
		}
		// 오늘 방문한 매물 페이지
		
		// 관심등록
		List<IVO> checkList = dao.getCheck(map);
		if (checkList.isEmpty() == true) {
			String checkI = "empty";
			req.setAttribute("checkI", checkI);
		} else {
			String onOut ="";
			for (IVO k : checkList) {
				onOut = k.getT_interest();
			}
			if (onOut.equals("0")) {
				String checkI = "empty";
				req.setAttribute("checkI", checkI);
			} else {
				String checkI = "full";
				req.setAttribute("checkI", checkI);
			}
		}
		CVO cvo =	dao.getOneList(viewNum);
		// 히트 수 증가
		int hit = Integer.parseInt(cvo.getEdu_hit())+1;
		cvo.setEdu_hit(String.valueOf(hit));		
		//DB 히트 update
		dao.getHitUp(cvo);
		mv.addObject("cvo", cvo);
		return mv;
	}
	
	@RequestMapping("/tradeaply.do")
	public ModelAndView getTrade(HttpServletRequest req,HttpServletResponse res) {
		ModelAndView mv = new ModelAndView("treade_aply");
		return mv;
	}
	
	@RequestMapping(value="/tradeAply.do",method=RequestMethod.POST)
	public ModelAndView getCinsert(CVO cvo ,HttpServletRequest req, 
			@RequestParam("t_image_1") MultipartFile t_image_1,
			@RequestParam("t_image_2") MultipartFile t_image_2) {
		ModelAndView mv = new ModelAndView("redirect:/index.do");
		try {
			String path = req.getSession().getServletContext().getRealPath("/resources/images/db");
			cvo.setT_image_1(t_image_1.getOriginalFilename());
			cvo.setT_image_2(t_image_2.getOriginalFilename());
			
			int result = dao.getTinsert(cvo);
			if(result > 0) {
				byte[] in = t_image_1.getBytes();
				File out = new File(path, cvo.getT_image_1());
				FileCopyUtils.copy(in, out);
				
				byte[] in1 = t_image_2.getBytes();
				File out1 = new File(path, cvo.getT_image_2());
				FileCopyUtils.copy(in1, out1);
			}
		} catch (Exception e) {
		}
		return mv;
	}
	
	@RequestMapping("/treade_aply2.do")
	public ModelAndView getTrade2(HttpServletRequest req,HttpServletResponse res) {
		ModelAndView mv = new ModelAndView("treade_aply2");
		return mv;
	}
	
	@RequestMapping(value="/tradeAply2.do",method=RequestMethod.POST)
	public ModelAndView getbinsert(BVO bvo ,HttpServletRequest req, 
			@RequestParam("t_image_1") MultipartFile t_image_1,
			@RequestParam("t_image_2") MultipartFile t_image_2) {
		ModelAndView mv = new ModelAndView("redirect:/index.do");
		try {
			String path = req.getSession().getServletContext().getRealPath("/resources/images/db");
			bvo.setT_image_1(t_image_1.getOriginalFilename());
			bvo.setT_image_2(t_image_2.getOriginalFilename());
			
			int result = dao.getBinsert(bvo);
			if(result > 0) {
				byte[] in = t_image_1.getBytes();
				File out = new File(path, bvo.getT_image_1());
				FileCopyUtils.copy(in, out);
				
				byte[] in1 = t_image_2.getBytes();
				File out1 = new File(path, bvo.getT_image_2());
				FileCopyUtils.copy(in1, out1);
			}
		} catch (Exception e) {
		}
		return mv;
	}
	
	@RequestMapping("/interest.do")
	public ModelAndView getInterest(HttpServletRequest req,HttpServletResponse res) throws SQLException {
		ModelAndView mv = new ModelAndView("interest");
		Paging pvo = new Paging();
		// 1. 전체 게시물의 수 구하기
		pvo.setTotalRecord(dao.getTotalCount()); 
		
		// 2. 전체 페이지의 수 구하기
		pvo.seteTotalPage();
		
		// 3. 현재 페이지를 구하기
		String cPage = req.getParameter("cPage");
		if(cPage!= null) {
			// null이 아니면 cPage가 nowPage가 된다. 
			pvo.setNowPage(Integer.parseInt(cPage));
		}
		// null 이면 그냥 pvo에 존재하는 nowPage사용하면 된다.
		
		// 4. 각 페이지의 시작번호와 끝번호 구하기
		pvo.setBegin((pvo.getNowPage()-1)*pvo.getNumPerPage()+1);
		pvo.setEnd((pvo.getBegin()-1)+pvo.getNumPerPage());
		
		// 5.시작번호와 끝번호를 이용해서 select문 실행
		String u_number = req.getParameter("u_idx");
		int u_numbers = Integer.parseInt(u_number);
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", pvo.getBegin());
		map.put("end", pvo.getEnd());
		map.put("u_idx", u_numbers);
		
		// 6. 블록시작번호와 블록끝번호를 구하자
		pvo.setBeginPage(((pvo.getNowPage()-1)/pvo.getPagePerBlock())*pvo.getPagePerBlock()+1);
		pvo.setEndPage(pvo.getBeginPage()+pvo.getPagePerBlock()-1);
			
		// 주의 사항 : endPage가 totalPage보다 클 경우 존재
	    //            endPage을 totalPage에 맞춘다.
		if(pvo.getEndPage() > pvo.getTotalPage()) {
			pvo.setEndPage(pvo.getTotalPage());
		}
		List<CVO> list = dao.getInterestList(map);
		mv.addObject("list", list);
		mv.addObject("pvo", pvo);
		mv.addObject("cPage", cPage);  
		return mv;
	}
	
	@RequestMapping("/modify_agree.do")
	public ModelAndView getmodify_agree(HttpServletRequest req,HttpServletResponse res) {
		ModelAndView mv = new ModelAndView("modify_agree");
		return mv;
	}
	
	@RequestMapping("/login_agree.do")
	public ModelAndView getLogin_agree(HttpServletRequest req,HttpServletResponse res) {
		ModelAndView mv = new ModelAndView("login_agree");
		return mv;
	}
	
	@RequestMapping("/insert.do")
	public ModelAndView getInsert(HttpServletRequest req,HttpServletResponse res) throws SQLException {
		
		ModelAndView mv = new ModelAndView("redirect:/index.do");
		MVO mvo = new MVO();
		mvo.setU_id(req.getParameter("id"));
		mvo.setU_pass(req.getParameter("pw"));
		mvo.setU_name(req.getParameter("name"));
		mvo.setU_phon(req.getParameter("phon"));
		mvo.setU_zen(req.getParameter("gen"));
		mvo.setU_edu_name(req.getParameter("edu_name"));
		mvo.setU_mail(req.getParameter("email_1") + "@" + req.getParameter("email_2"));

		// DB처리
		dao.getInsert(mvo);
		return mv;
	}
	
	@RequestMapping("/reference_room.do")
	public ModelAndView getReferenceRoom(HttpServletRequest req,HttpServletResponse res) throws SQLException {
		ModelAndView mv = new ModelAndView("reference_room");
		List<DVO> list =dao.getdatalist();
		mv.addObject("list", list);
		return mv;
	}
	

@RequestMapping("/reference_room1.do")
	public ModelAndView getReferenceRoom1(HttpServletRequest req,HttpServletResponse res) throws SQLException {
		ModelAndView mv = new ModelAndView("reference_room");
		String more = req.getParameter("more");
		int count = dao.getDateCount();
		List<DVO> list =dao.getdatalist(more);
		mv.addObject("list", list);
		mv.addObject("more", more);
		mv.addObject("count", count);
		return mv;
	}
	
	@RequestMapping("/reference_view.do")
	public ModelAndView getreference_view(HttpServletRequest req,HttpServletResponse res) throws SQLException {
		ModelAndView mv = new ModelAndView("reference_view");
		String data_idx = req.getParameter("data_idx");
		DVO onelist = dao.getdataOne(data_idx);
		String r_num = onelist.getR_num();
		List<DVO> r_numlist = dao.getr_numlist(r_num);
		String r_number1 = r_numlist.get(0).getR_num();
		String r_number2 = r_numlist.get(1).getR_num();

		if (r_numlist.size() == 3) {	
			DVO beforelist = r_numlist.get(0);
			DVO afterlist = r_numlist.get(2);
			mv.addObject("onelist", onelist);
			mv.addObject("beforelist", beforelist);
			mv.addObject("afterlist", afterlist);
		} else if (r_numlist.size() == 2) {
			if (r_number1.equals("1") && r_number2.equals("2")) {
				DVO afterlist = r_numlist.get(1);
				mv.addObject("onelist", onelist);
				mv.addObject("beforelist", null);
				mv.addObject("afterlist", afterlist);
			} else {
				DVO beforelist = r_numlist.get(0);
				mv.addObject("onelist", onelist);
				mv.addObject("beforelist", beforelist);
				mv.addObject("afterlist", null);
			}
		}
		
		// 히트 수 증가
		int hit = Integer.parseInt(onelist.getT_count())+1;
		onelist.setT_count(String.valueOf(hit));
				
		//DB 히트 update
		dao.getDHitUp(onelist);
		
		
		return mv;
	}
	

	@RequestMapping("/file_down.do")
	public ModelAndView getfile_down(@RequestParam("d_filename") String d_filename,HttpServletRequest req,HttpServletResponse res) throws SQLException {
		ModelAndView mv = new ModelAndView("reference_view");
		try {
	    	// 위치
			String path = req.getSession().getServletContext().getRealPath("/resources/images/db");
			String encoded_path = URLEncoder.encode(d_filename, "utf-8");
			
			// 브러우저 설정
			res.setContentType("application/x-msdownload");
			res.setHeader("Content-Disposition", "attachment; filename="+encoded_path);
			
			// 실제 I/O
			File file = new File(path+"/"+new String(d_filename.getBytes("utf-8")));
			FileInputStream fis = new FileInputStream(file);
			BufferedInputStream in = new BufferedInputStream(fis);
			
			OutputStream out = res.getOutputStream();
			FileCopyUtils.copy(in, out);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		String data_idx = req.getParameter("data_idx");
		DVO onelist = dao.getdataOne(data_idx);
		mv.addObject("onelist", onelist);
		return mv;
	}
	
	
	@RequestMapping("/masterPage.do")
	public ModelAndView getmasterPage(HttpServletRequest req,HttpServletResponse res) {
		ModelAndView mv = new ModelAndView("masterPage");
		return mv;
	}
	
	@RequestMapping("/data_Insert.do")
	public ModelAndView getdata_Insert(HttpServletRequest req,HttpServletResponse res) {
		ModelAndView mv = new ModelAndView("data_Insert");
		return mv;
	}
	
	@RequestMapping(value="/d_insert.do", method=RequestMethod.POST)
	public ModelAndView getdinsert(
			DVO dvo,
			@RequestParam("t_data") MultipartFile file,
			HttpServletRequest req,HttpServletResponse res
			) {
		String path = req.getSession().getServletContext().getRealPath("/resources/images/db");
		ModelAndView mv = new ModelAndView("redirect:/reference_room.do");
		try {
			String file_name = file.getOriginalFilename();
			String filetype = file.getContentType();
			dvo.setD_filename(file_name);
			long size =  file.getSize()/1024; // KB
			// 올린파일을 byte[]로 만듬
			byte[] in = file.getBytes();
			// 올린 장소와 저장이름
			File out = new File(path,file_name);
			// 복사(upload)
			FileCopyUtils.copy(in, out);
			// 수정날짜는 지정할 수 없다.
			dao.getdateup(dvo);
		} catch (Exception e) {
		}
		return mv;	
	}
	
	
	
}
