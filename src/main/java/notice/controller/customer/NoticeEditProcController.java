package notice.controller.customer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import notice.controller.NController;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeEditProcController implements NController {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		System.out.println("NoticeEditProcController 도착");
		

		request.setCharacterEncoding("utf-8");


		String num=request.getParameter("c");
		String title=request.getParameter("title");
		String content=request.getParameter("content");

		Notice no=new Notice();
		no.setTitle(title);
		no.setContent(content);
		no.setSeq(num);

		NoticeDao dao=new NoticeDao();
		int cnt=dao.update(no);


		no=dao.getNoice(num);
		request.setAttribute("n", no);
	    
	    request.getRequestDispatcher("noticeDetail.jsp").forward(request, response);;
		/*
		 * if(cnt>0){ response.sendRedirect("noticeDetail.do?c="+num); }
		 */


		
		
	}

}
