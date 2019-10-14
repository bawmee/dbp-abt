
package controller.post;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.dao.PointDAO;
import model.dao.PostDAO;

public class FileDownController implements Controller {

	
	private PointDAO pointDAO = null; 
	PostDAO postDAO = null; 
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		
		pointDAO = new PointDAO();
		pointDAO.TakePoint((String)session.getAttribute("user"));
		pointDAO.RecordPoint("use", Integer.valueOf( (String)request.getParameter("postId") ), (String)session.getAttribute("user"));
		
		postDAO = new PostDAO();
		postDAO.DownLoadCount( Integer.valueOf( (String)request.getParameter("postId") ) );
		
		ServletContext context = request.getServletContext();
		String path = context.getRealPath("/templet");
		
		
		
		request.setAttribute("path", path);
		request.setAttribute("fileName", (String)request.getParameter("file"));
        request.setAttribute("viewFileName", (String)request.getParameter("file"));
		return "/post/file_down.jsp";	
        
	}

}

