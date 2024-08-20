package notice.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mvc.service.ServiceProvider;
import notice.model.NoticeBoard;
import notice.service.NoticeService;
import util.FactoryUtil;

@WebServlet("*.nb")
public class NoticeBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ServiceProvider<NoticeBoard> service = new NoticeService();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("nb get 요청");
		
		String cmd = FactoryUtil.getCommand(request);
		
		String nextPage = null;
		
		if(cmd.equals("notice_list.nb")) {
			System.out.println("Notice List 호출");
			request.setAttribute("noticeList", service.getList(request));
			nextPage="/board/board_list.jsp";
		}
		
		if(cmd.equals("notice_write.nb")) {
			System.out.println("Notice 글작성 요청");
			nextPage="/board/board_write.jsp";
		}
		
		if(cmd.equals("notice_detail.nb")) {
			System.out.println("Notice Detail 호출");
			request.setAttribute("notice", service.read(request, response));
			nextPage="/board/board_detail.jsp";
		}
		
		if(cmd.equals("notice_update.nb")) {
			System.out.println("Notice 글수정 화면 요청");
			request.setAttribute("notice", service.read(request, response));
			nextPage="/board/board_update.jsp";
		}
		
		if(cmd.equals("notice_delete.nb")) {
			System.out.println("Notice 글삭제 요청");
			service.delete(request, response);
		}
		
		FactoryUtil.nextPage(request, response, nextPage);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("nb Post 요청");
		request.setCharacterEncoding("UTF-8");
		
		String cmd = FactoryUtil.getCommand(request);
		
		String nextPage = null;
		
		if(cmd.equals("notice_write_submit.nb")) {
			System.out.println("Notice 글작성 완료 요청");
			service.write(request, response);
		}
		
		if(cmd.equals("notice_update_submit.nb")) {
			System.out.println("Notice 글수정 완료 요청");
			service.update(request, response);
		}
		FactoryUtil.nextPage(request, response, nextPage);
	}

}
