package notice.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface NController {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception ;
	//추상 메소드 모임
	
	
}
