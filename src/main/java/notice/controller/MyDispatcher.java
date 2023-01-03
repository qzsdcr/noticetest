package notice.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import notice.controller.customer.NoticeController;
import notice.controller.customer.NoticeDetailController;
import notice.controller.customer.NoticeEditController;
import notice.controller.customer.NoticeEditProcController;
import notice.controller.customer.NoticeRegController;
import notice.controller.customer.NoticeRegProcController;

public class MyDispatcher extends HttpServlet {
	
	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		System.out.println(".do 신호");
		String uri= request.getRequestURI();
		String conPath=request.getContextPath();
		String com=uri.substring(conPath.length());
	
		System.out.println("com : "+com );
		
	//	NoticeDetailController controller1=new NoticeDetailController();
	//	NoticeEditController controller2=new NoticeEditController();
		NController ncontroller=null;
		
		
		try {
			if(com.equals("/customer/noticeDetail.do")) {
		//		controller1.execute(request,response);
				ncontroller= new NoticeDetailController();
				
			}
			
			else if(com.equals("/customer/noticeEdit.do")) {
		//		controller2.execute(request,response);
				ncontroller=new NoticeEditController();
			}
			else if(com.equals("/customer/noticeEditProc.do")) {
				//		controller2.execute(request,response);
						ncontroller=new NoticeEditProcController();
			}else if(com.equals("/customer/noticeReg.do")) {
			
						ncontroller=new NoticeRegController();
			}else if(com.equals("/customer/noticeRegProc.do")) {
				
						ncontroller=new NoticeRegProcController();
			}else if(com.equals("/customer/notice.do")) {
			
						ncontroller=new NoticeController();
			}
			ncontroller.execute(request, response);
			
		}catch (Exception e) {

		}
		
	
	}//둘다 캐치
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		super.doGet(req, resp);
//	}//겟방식은 여기서 캐치
//	
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		super.doPost(req, resp);
//	}//포스트는 여기서 캐치
//	
}
