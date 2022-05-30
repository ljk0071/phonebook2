package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.PhoneDao;
import com.javaex.vo.PersonVo;

/**
 * Servlet implementation class PhoneController
 */
@WebServlet("/pbc")
public class PhoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		PhoneDao phoneDao = new PhoneDao();
		List<PersonVo> phoneList = phoneDao.SelectAll();
		
		
		String action = request.getParameter("action");
		
		
		
		if(action.equals("writeform")) {
			RequestDispatcher rd = request.getRequestDispatcher("/writeForm.jsp");
			rd.forward(request, response);
			
		}else if( action.equals("list") ){
			request.setAttribute("pList", phoneList);
			RequestDispatcher rd = request.getRequestDispatcher("/list.jsp");
			rd.forward(request, response);
			
		}else if (action.equals("write") ) {
			String name = request.getParameter("name");
			String hp = request.getParameter("hp");
			String company = request.getParameter("company");
			
			PersonVo personVo = new PersonVo(name, hp, company);
			phoneDao.Insert(personVo);
			
			response.sendRedirect("/phonebook2/pbc?action=list");
			
		}else if(action.equals("delete")) {
			String id = request.getParameter("id");
			phoneDao.Delete(Integer.parseInt(id));
			response.sendRedirect("/phonebook2/pbc?action=list");
			
		}else if (action.equals("updateform")) {
			RequestDispatcher rd = request.getRequestDispatcher("/updateForm.jsp");
			rd.forward(request, response);
			
		}else if (action.equals("update")){
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String hp = request.getParameter("hp");
			String company = request.getParameter("company");

			PersonVo personVo = new PersonVo(Integer.parseInt(id), name, hp, company);
			phoneDao.Update(personVo);
			
			response.sendRedirect("/phonebook2/pbc?action=list");
		}else {
			System.out.println("action파라미터 없음");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
