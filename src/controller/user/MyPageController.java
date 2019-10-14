package controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.service.UserManager;
import model.service.UserNotFoundException;
import model.Post;
import model.User;
import model.dao.PostDAO;

public class MyPageController implements Controller {
	
	PostDAO postDAO = new PostDAO();
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	if (!UserSessionUtils.isLogined(request.getSession())) {
    		return "redirect:/user/login/form";		// login form 요청으로 redirect
        }
    		
    	User user = null;
    	String userId = request.getParameter("user_id");
    	UserManager manager = UserManager.getInstance();
    	
    	try {
    		user = manager.findUser(userId);
    	}catch(UserNotFoundException e) {
    		return "redirect:/user/list";
    	}
    	
    	List<Post> postList = postDAO.findPostListByUser(userId);
    	request.setAttribute("postList", postList);	
    	
    	
    	List<Post> DownpostList = postDAO.findPostListByDown(userId);
    	request.setAttribute("downpostList", DownpostList);	
    	
    	request.setAttribute("user", user);
    	return "/user/mypage.jsp";
    	
    }
}
