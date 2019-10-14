package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.Post;
import model.User;
import model.dao.PostDAO;
import model.dao.UserDAO;

public class MainController implements Controller {
	
	PostDAO postDAO = new PostDAO();
	
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	

    	List<Post> postList = postDAO.findPostListDown("main");
    	
    	request.setAttribute("postList", postList);	
    	
    	return "/main/main.jsp";
    }
}