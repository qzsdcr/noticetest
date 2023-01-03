package notice.controller.customer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import notice.controller.NController;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeRegProcController implements NController {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		System.out.println("NoticeRegProcController 도착");
		


		String title = request.getParameter("title");
		String content = request.getParameter("content");

		Notice no=new Notice();
		no.setTitle(title);
		no.setContent(content);

		NoticeDao dao=new NoticeDao();
		dao.insert(no);


		response.sendRedirect("notice.jsp");
		
		
	}

}
