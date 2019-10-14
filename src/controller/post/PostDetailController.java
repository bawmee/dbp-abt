package controller.post;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.DispatcherServlet;
import controller.user.UserSessionUtils;
import model.Review;
import model.dao.PointDAO;
import model.dao.PostDAO;
import model.dao.ReviewDAO;

public class PostDetailController implements Controller {
	private ReviewDAO reviewDAO = null;
	private PointDAO pointDAO = null;
	Review review = null;

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String post_id = (String) request.getParameter("postId");

		String pri = "/post/detail?postId=" + post_id;

		if (!UserSessionUtils.isLogined(request.getSession())) {

			session.setAttribute("url_prior_login", pri);

			return "redirect:/user/login/form"; // login form 요청으로 redirect
		}

		PostDAO post = new PostDAO();
		request.setAttribute("post", post.findPost(post_id));

		request.setCharacterEncoding("UTF-8");

		if (request.getParameter("content") != null) {
			review = new Review(Integer.parseInt(post_id), (String) session.getAttribute("user"),
					request.getParameter("content"));

			final Logger logger = LoggerFactory.getLogger(PostDetailController.class);
			logger.debug((String) session.getAttribute("user"), request.getParameter("content"));

			reviewDAO = new ReviewDAO();
			reviewDAO.create(review);

			pointDAO = new PointDAO();
			pointDAO.GiveReviewPoint((String) session.getAttribute("user"));

			pointDAO.RecordPoint("get", Integer.parseInt(post_id), (String) session.getAttribute("user"));
		}
			ReviewDAO reviewDAO = ReviewDAO.getInstance();
			List<Review> reviewList = reviewDAO.getReviewList(Integer.parseInt(post_id));

			// 댓글이 1개라도 있다면 request에 List를 세팅
			if (reviewList.size() > 0)
				request.setAttribute("reviewList", reviewList);

			return "/post/show.jsp";
		
	}
}
