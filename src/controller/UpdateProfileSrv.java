package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;

/**
 * Servlet implementation class UpdateProfileSrv
 */
@WebServlet("/UpdateProfileSrv")
public class UpdateProfileSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateProfileSrv() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {



		

		String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobileString = request.getParameter("mobile");
        Long mobile = Long.parseLong(mobileString);
        String address = request.getParameter("address");
        String pincodeString = request.getParameter("pincode");
        Integer pincode = Integer.parseInt(pincodeString);
        
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setMobile(mobile);
        user.setAddress(address);
        user.setPinCode(pincode);


		RequestDispatcher rd = request
				.getRequestDispatcher("userProfile.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	
}


