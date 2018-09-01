package com.janditour.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.janditour.common.Util;
import com.janditour.service.BookMarkService;
import com.janditour.service.MemberService;
import com.janditour.vo.BookMark;
import com.janditour.vo.ImageFile;
import com.janditour.vo.Member;

@Controller
public class MemberController {

	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	@Autowired
	@Qualifier("bookMarkService")
	private BookMarkService bookMarkService;

	@RequestMapping(value = "/join.action", method = RequestMethod.POST)
	public String join(Member member) {
		// try {
		memberService.joinMember(member);
		return "home";
	}

	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(
			String memId, String memPw, HttpSession session, 
			HttpServletResponse response,HttpServletRequest request) throws IOException{
		
		Member member = memberService.login(memId, memPw);
		String returnUrl = "";
		if (member != null) {
			session.setAttribute("loginuser", member);
			try {
				response.sendRedirect(request.getHeader("referer"));
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('환영합니다');</script>");
				out.flush();
			} catch (IOException e) {
			 e.printStackTrace();
			}
			
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('입력하신 정보가 일치하지 않습니다!');" + "history.go(-1);</script>");
			out.flush();
		}
		return "home";
	}

	@RequestMapping(value = "/logout.action", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginuser");
		
		return "redirect:/home.action";
	}

	@RequestMapping(value = "/profileImgUpload.action", method = RequestMethod.GET)
	public String selectProfile(@RequestParam(value = "memNo") String memNo, Member member, Model model,
			BookMark bookMark) {
		member = memberService.memberProfile(member);
		bookMark.setMemNo(memNo);
		
		List<BookMark> attachmentFoo = bookMarkService.BookMarkReadFood(bookMark);
		List<BookMark> attachmentTou = bookMarkService.BookMarkReadTourist(bookMark);
		List<BookMark> attachmentSta = bookMarkService.BookMarkReadStay(bookMark);
		List<BookMark> attachment = bookMarkService.BookMarkRead(bookMark);
		model.addAttribute("attachmentFoo", attachmentFoo);
		model.addAttribute("attachmentTou", attachmentTou);
		model.addAttribute("attachmentSta", attachmentSta);
		model.addAttribute("attachment", attachment);
		model.addAttribute("member", member);
		model.addAttribute("memNo", memNo);
		
		return "profile";
	}

	@RequestMapping(value = "/profileImgUpload.action", method = RequestMethod.POST)
	public String uploadImg(MultipartHttpServletRequest request, String memNo, Model model) {
		Member memFile = null;
		MultipartFile file = request.getFile("memFile");// 업로드된 파일 읽기
		if (!file.isEmpty() && file.getOriginalFilename().length() != 0) {
			String path = // 업로드된 파일을 저장할 경로
					request.getServletContext().getRealPath("/resources/upload-image/member-info");
			String savedFileName = file.getOriginalFilename();
			savedFileName = Util.getUniqueFileName(savedFileName);
			try {
				// 지정된 경로에 업로드된 파일 저장
				file.transferTo(new File(path, savedFileName));
				memFile = new Member();
				memFile.setMemFile(savedFileName);
				memFile.setMemNo(memNo);
			} catch (Exception ex) {
			}
		}
	Member member = memberService.profileImageUpload(memFile);
	


		model.addAttribute("member", member);
		model.addAttribute("memFile", memFile);
		model.addAttribute("memNo", memNo);
		return "profile";
	}

	@RequestMapping(value = "/modifyAccount.action", method = RequestMethod.GET)
	public String selectOldInfo(@RequestParam(value = "memNo") String memNo, Member member, Model model) {
		member = memberService.oldInfoShow(member);
		model.addAttribute("member", member);
		model.addAttribute("memNo", memNo);
		return "setting";
	}

	@RequestMapping(value = "/modifyAccount.action", method = RequestMethod.POST)
	public String modifyEmailInfo(@RequestParam(value = "oldEmail") String oldEmail,
			@RequestParam(value = "confirmEmail") String confirmEmail, @RequestParam(value = "memNo") String memNo,
			@RequestParam(value = "newEmail") String newEmail, Member member, Model model, HttpServletResponse response)
			throws IOException {
		member = memberService.selectOldEmail(memNo);
		if (!(member.getMemEmail().equals(oldEmail))) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이메일정보가 일치하지 않습니다!');" + "history.go(-1);</script>");
			out.flush();
			return "setting";
		}

		if (member.getMemEmail().equals(oldEmail)) {
			if (newEmail.equals(confirmEmail)) {
				member.setMemEmail(newEmail);
				memberService.updateEmail(member);
				model.addAttribute("memEmail", newEmail);
				model.addAttribute("member", member);
				model.addAttribute("memNo", memNo);
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('이메일이 변경되었습니다!');" + "history.go(-3);</script>");
				out.flush();
			}
		}
		return "home";
	}
	
	@RequestMapping(value = "/modifyId.action", method = RequestMethod.POST)
	public String modifyIdInfo(
			@RequestParam(value="oldId")String oldId,
			@RequestParam(value="newId")String newId,
			@RequestParam(value="confirmId")String confirmId,
			@RequestParam(value = "memNo") String memNo,
			Member member, Model model, HttpServletResponse response) throws IOException {
		member = memberService.selectOldId(memNo);
		if (!(member.getMemId().equals(oldId))) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디정보가 일치하지 않습니다!');" + "history.go(-1);</script");
			out.flush();
			return "setting";
		}
		if (member.getMemId().equals(oldId)) {
			if (newId.equals(confirmId)) {
				member.setMemId(newId);
				memberService.updateId(member);
				model.addAttribute("memId", newId);
				model.addAttribute("member", member);
				model.addAttribute("memNo", memNo);
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('아이디가 변경되었습니다!');" + "history.go(-3);</script>");
				out.flush();
			}
		}
		return "home";
	}

	@RequestMapping(value = "/modifyPw.action", method = RequestMethod.POST)
	public String modifyPwInfo(
			@RequestParam(value="oldPw")String memPw,
			String newPw, String confirmPw, String memNo,
			Member member, Model model, HttpServletResponse response) throws IOException {
		
		member = memberService.selectOldPw(memNo, memPw);
		member.setMemPw(memPw);
		if (!(member.getMemPw().equals(memPw))) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호정보가 일치하지 않습니다!');" + "history.go(-1);</script");
			out.flush();
			return "setting";
		}
		if (member.getMemPw().equals(memPw)) {
			if (newPw.equals(confirmPw)) {
				member.setMemPw(newPw);
				
				memberService.updatePw(member);
				
				model.addAttribute("memPw", newPw);
				model.addAttribute("member", member);
				model.addAttribute("memNo", memNo);
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('비밀번호가 변경되었습니다!');" + "history.go(-3);</script>");
				out.flush();
			}
		}
		return "home";
	}
	
	@RequestMapping(value = "/findId.action", method = RequestMethod.POST)
	public String findMyId(
			String memName, String memEmail, String memPhone,Member member,
			Model model) {
		member.setMemName(memName);
		member.setMemEmail(memEmail);
		member.setMemNo(memPhone);
		member = memberService.findId(member);
		model.addAttribute("memName", memName);
		model.addAttribute("memEmail", memEmail);
		model.addAttribute("memPhone", memPhone);
		model.addAttribute("member", member);
		return "member";
	}
	
	
	
}
