package it.will.kingsmap;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import it.will.kingsmap_mybatis.dao.ThePager;
import it.will.kingsmap_mybatis.dto.CommentDTO;
import it.will.kingsmap_mybatis.dto.ReplyDTO;
import it.will.kingsmap_mybatis.service.CommentService;

@Controller
public class CommentController {

	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/comment_list")
	public ResponseEntity<List<CommentDTO>> commentList(){
		ResponseEntity<List<CommentDTO>> comment=null;
		try {
			comment = new ResponseEntity<List<CommentDTO>>
			(commentService.getCommentList(), HttpStatus.OK);
		} catch (Exception e) {
			comment = new ResponseEntity<List<CommentDTO>>(commentService.getCommentList(), HttpStatus.BAD_REQUEST);		
		}
		return comment;
	}
	
	// �Խ��� ����
/*	@RequestMapping("/comment")
	public String comment(HttpServletRequest request, CommentDTO commentDTO, Model model){
		
		String ipaddr = request.getHeader("X-FORWARDED-FOR");
		if(ipaddr==null) {
			ipaddr = request.getRemoteAddr();
		}
		
		model.addAttribute("commentDTO", commentDTO.getNum());
		model.addAttribute("ipaddr", ipaddr);
		return "comment/comment";
	}*/
	
	// �Խ��� ����
	@RequestMapping("/comment")
	public String comment(Model model, CommentDTO commentDTO){
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String ipaddr = request.getHeader("X-FORWARDED-FOR");
		if(ipaddr==null) {
			ipaddr = request.getRemoteAddr();
		}
		
		// System.out.println("===================ip�ּ�1 = " + ipaddr);
		
		String[] ipaddrs = ipaddr.split("\\.");
		ipaddr = "( " + ipaddrs[0] + "." + ipaddrs[1] + "." + ipaddrs[2].replace(ipaddrs[2], "***") + "." + ipaddrs[3].replace(ipaddrs[3], "***") + " )";
		// System.out.println("===================ip�ּ�2 = " + ipaddr);

		model.addAttribute("commentDTO", commentDTO);
		model.addAttribute("ipaddr", ipaddr);
		return "comment";
	}
	
	// �Խñ� ���(����¡ x)
	@RequestMapping("/list_comment")
	@ResponseBody	
	public List<CommentDTO> commentLists(){
		return commentService.getCommentList();
	}
	
	
	// ����¡ ó��
	@RequestMapping("/list_comment2")
	@ResponseBody
	public Map<String, Object> pagingCommentList(@RequestParam String pageNum){
		int pNum = Integer.parseInt(pageNum);
		// System.out.println(/*pNum */ pageNum + "====================��Ʈ�ѷ� =================");
		
		int totalBoard = commentService.getCommentCount();
		ThePager pager = new ThePager(pNum, totalBoard, 3, 5);
		// System.out.println("pageNum="+pageNum);
		
		Map<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pager", pager);
		map.put("commentList", commentService.getPagingList(pagerMap));
		return map;
	}

	
	// ��ü �Խñ� ���� ��ȯ
	@RequestMapping("/commentCount")
	@ResponseBody
	public int countComment() {
		return commentService.getCommentCount();
	}

	// �Խñ� ���
	@RequestMapping(value="/add_comment", method=RequestMethod.POST)
	@ResponseBody
	public String addComment(@RequestBody CommentDTO commentDTO, Model model) {
		model.addAttribute("commentDTO", commentDTO);
		commentService.addComment(commentDTO);
		return "success";
	}
	
	// �Խñ� ����
	@RequestMapping(value="/remove_comment2", method=RequestMethod.POST)
	@ResponseBody
	public String deleteComment2(@RequestParam int num, @RequestParam String passwordConfirm, HttpSession session) {
		String password = commentService.getPassword(num);
		// System.out.println("��й�ȣ = " + password);
		// System.out.println("Ȯ�ι�ȣ = " + passwordConfirm);
		if(password.equals(passwordConfirm)) {
			commentService.removeComment(num);
			System.out.println("���� ����");
			return "success";
		} else {
			return "false";
		}
	}
	
	// �Խñ� ����
	@RequestMapping(value="/update_comment", method=RequestMethod.POST)
	@ResponseBody
	public String updateComment(@RequestParam int num, @RequestParam String passwordConfirm
			, @RequestParam String content, CommentDTO commentDTO, Model model) {
		
		// System.out.println("�׽�Ʈ = " + num);
		// System.out.println("������ = " + content);
		String password = commentService.getPassword(num);
		// System.out.println("��й�ȣ = " + password);
		// System.out.println("Ȯ�ι�ȣ = " + passwordConfirm);
		if(password.equals(passwordConfirm)) {
			commentService.modifyComment(commentDTO);
			String modifyDate = commentDTO.setDay(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			model.addAttribute("modifyDate", modifyDate);
			// System.out.println("���� ����");
			return "success";
		} else {
			return "false";
		}
	}

/*	@RequestMapping(value="/remove_comment/{num}", method=RequestMethod.DELETE)
	@ResponseBody
	public String deleteComment(@PathVariable int num) {
		commentService.removeComment(num);
		return "success";
	}*/
	
	@RequestMapping(value="/add_reply", method=RequestMethod.POST)
	@ResponseBody
	public String insertReply(@RequestBody ReplyDTO replyDTO) {
		commentService.addReply(replyDTO);
		return "success";
	}
	
	// ��� ����Ʈ ��ü ���
	@RequestMapping(value="/list_reply", method=RequestMethod.POST)
	@ResponseBody
	public List<ReplyDTO> replyList(int commentNum) {
		return commentService.getReplyList(commentNum);
	}
}
