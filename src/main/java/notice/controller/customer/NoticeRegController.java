package notice.controller.customer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import notice.controller.NController;

public class NoticeRegController implements NController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("NoticeRegController 도착");
		
		
		//화면전환
		
	    request.getRequestDispatcher("noticeReg.jsp").forward(request, response);

	}

	
	
	
	
}
