package article.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import article.service.ArticleContentNotFoundException;
import article.service.ArticleData;
import article.service.ArticleNotFoundException;
import article.service.DeleteArticleService;
import article.service.ReadArticleService;
import auth.service.User;
import mvc.command.CommandHandler;

public class DeleteArticleHandler implements CommandHandler {
	
	private static final String FORM_VIEW = "deleteArticleForm";
	
	private ReadArticleService readService = new ReadArticleService();
	private DeleteArticleService deleteArticleService = new DeleteArticleService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			return processSubmit(req, res);
		} else {
			res.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String processForm(HttpServletRequest req, HttpServletResponse res) {
		
		return FORM_VIEW;
	}

	private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws IOException {
		//현재 로그인한 사용자 
		//삭제 하려는 게시물의 작성자
		HttpSession session = req.getSession();
		User authUser = (User)session.getAttribute("authUser");
		int no = Integer.parseInt(req.getParameter("no"));
		String password = req.getParameter("password");
		
		ArticleData articleData = readService.getArticle(no, false);
		// 같으면 삭제
		//	암호가 일치하는지 확인해서 
		//		일치하면 삭제 
		//		아니면 throw exception
		
		//같지 않으면 throw exception
		if (!authUser.getId().equals(articleData.getArticle().getWriter().getId())) {
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		}
		try {
			deleteArticleService.delete(no, authUser, password);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
		return "deleteArticleSuccess";
	}
}

