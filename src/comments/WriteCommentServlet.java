package comments;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import databaseInteractor.Comment;
import databaseInteractor.DatabaseInteractor;

/**
 * Servlet implementation class WriteCommentServlet
 */
@WebServlet("/WriteCommentServlet")
public class WriteCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("inside servlet");
		DatabaseInteractor dbInteractor = (DatabaseInteractor) getServletContext().getAttribute("dbInteractor");
		String username = request.getParameter("username");
		String houseName = request.getParameter("houseName");
		String commentText = request.getParameter("commentText");
		Comment comment = new Comment(username, houseName, commentText);
		
		dbInteractor.insertComment(comment);
	}

}
