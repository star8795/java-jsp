package notice.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mvc.dao.DAOProvider;
import mvc.service.ServiceProviderAdapter;
import notice.dao.NoticeDAO;
import notice.model.NoticeBoard;
import util.Criteria;
import util.PageMaker;

public class NoticeService extends ServiceProviderAdapter<NoticeBoard>{
	
	DAOProvider<NoticeBoard> dao = new NoticeDAO();

	@Override
	public ArrayList<NoticeBoard> getList(HttpServletRequest request) {
		int page = 1;
		String pageNum = request.getParameter("page");
		if(pageNum != null) {
			page = Integer.parseInt(pageNum);
		}
		int totalCount = dao.count();
		Criteria cri = new Criteria(page,10);
		PageMaker pageMaker = new PageMaker(cri,totalCount);
		request.setAttribute("pm", pageMaker);
		return dao.getList(cri);
	}

	@Override
	public void write(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		NoticeBoard nb = new NoticeBoard(request);
		if(dao.write(nb)){
			out.print(getScript("작성 성공","notice_list.nb"));
		}else{
			out.print(getScript("작성 실패","notice_detail.nb?notice_num="+nb.getNotice_num()));
		}
	}

	@Override
	public NoticeBoard read(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		return dao.read(new NoticeBoard(request));
	}

	@Override
	public void update(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		NoticeBoard noticeBoard = new NoticeBoard(request);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(dao.update(noticeBoard)){
			out.print(getScript("수정 성공","notice_detail.nb?notice_num="+noticeBoard.getNotice_num()));
		}else{
			out.print(getScript("수정 실패","notice_update.nb?notice_num="+noticeBoard.getNotice_num()));
		}
	}

	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		NoticeBoard noticeBoard = new NoticeBoard(request);
		response.setContentType("text/html;charset=utf-8");
		System.out.println(noticeBoard.getNotice_num());
		PrintWriter out = response.getWriter();
		if(dao.update(noticeBoard)){
			out.print(getScript("삭제 성공","notice_list.nb"));
		}else{
			out.print(getScript("삭제 실패","notice_detail.nb?notice_num="+noticeBoard.getNotice_num()));
		}
	}
	
	public String getScript(String notice,String location) {
		String result = "";
		result +="<script>";
		result +="alert('"+notice+"');";
		result +="location.href='"+location+"';";
		result +="</script>";
		System.out.println(result);
		return result;
	}

}
