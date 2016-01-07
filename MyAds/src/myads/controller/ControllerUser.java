package myads.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myads.controller.action.Action;
import myads.controller.action.ActionForward;
import myads.controller.action.category.AddCompany;
import myads.controller.action.category.CompanyAction;
import myads.controller.action.category.ExistFrontMainCategory;
import myads.controller.action.member.*;
import myads.controller.action.posting.AddPosting;
import myads.controller.action.posting.AddPostingAction;
import myads.controller.action.posting.MyAdsAction;
import myads.controller.action.profile.ProfileAction;
import myads.controller.action.user.LoginUser;
import myads.controller.action.user.ViewUsers;

/**
 * Servlet implementation class ControllerAdmin
 */
@WebServlet("*.ads")

@MultipartConfig(fileSizeThreshold=1024 * 1024 * 10,
maxFileSize=1024 * 1024 * 10,
maxRequestSize=1024 * 1024 * 100
)

public class ControllerUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllerUser() {
        super();
    }
 
    private void doProccess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   	 	 String RequestURI=request.getRequestURI();//-------/myFriendProject/FriendWrite.friend
		 String contextPath=request.getContextPath();//-----/myFriendProject
		 String command=RequestURI.substring(contextPath.length());//----/FriendWrite.friend
		 
		// System.out.println(RequestURI);
		// System.out.println(contextPath);
		 System.out.println(command);
		 
		 ActionForward forward=new ActionForward();
		 Action action=null;
		 
		 if (command.equals("/")){
			 
		 }
		 
		 if (command.equals("/home.ads") || command.equals("/")){
			 try{
					forward.setPath("index.jsp");
				}catch(Exception e){
					e.printStackTrace();
				}
			 
			 System.out.println(forward.getPath());
			
		 }else if (command.equals("/lay_log.ads")){

			 action=new LoginAction();
			 try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
			 
			 System.out.println(forward.getPath());
			
		 }else if (command.equals("/lay_reg.ads")){
			 action=new RegisterAction();
			 try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
			 
			 System.out.println(forward.getPath());
		 }else if (command.equals("/lay_myadspages.ads")){
			 HttpSession session=request.getSession(true);
			 if (session.getAttribute("user")==null){
				 forward.setRedirect(true);
				 forward.setPath("lay_log.ads");
				 System.out.println(" Session Null");
			 }else{
			 action=new MyAdsAction();
			 try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
			 }
			 System.out.println(forward.getPath());
		 }else if (command.equals("/lay_newposting.ads")){
			 
			 action=new AddPostingAction();
			 try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
			 
			 System.out.println(forward.getPath());
		 }else if (command.equals("/add_newposting.ads")){
			 action=new AddPosting();
			 try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
			 
			 System.out.println(forward.getPath());
		 }else if (command.equals("/lay_myadsprofile.ads")){
			 HttpSession session=request.getSession(true);
			 if (session.getAttribute("user")==null){
				 forward.setRedirect(true);
				 forward.setPath("lay_log.ads");
				 System.out.println(" Session Null");
			 }else{
			 action=new ProfileAction();
			 try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
			 }
			 System.out.println(forward.getPath());
		 }else if (command.equals("/register.ads")){
			 action=new Register();
			 try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
			 
			 System.out.println(forward.getPath());
		 }else if (command.equals("/login.ads")){
			 action=new Login();
			 try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
			 
			 System.out.println(forward.getPath());
		 }else if (command.equals("/logout.ads")){
			 try{
				 HttpSession session=request.getSession(true);
				 /*session.removeAttribute("membername");
				 session.removeAttribute("id");*/
				 session.removeAttribute("user");
				 
					forward.setRedirect(true);
					forward.setPath("lay_log.ads");
					
				}catch(Exception e){
					e.printStackTrace();
				}
			 
			 System.out.println(forward.getPath());
		 }else if (command.equals("/lay_com.ads")){
			 action=new CompanyAction();
			 try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
			 
			 System.out.println(forward.getPath());
		 }else if (command.equals("/addnew_com.ads")){
			 action=new AddCompany();
			 try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
			 
			 System.out.println(forward.getPath());
		 }else if (command.equals("/mycategory.ads")){
			 action=new ExistFrontMainCategory();
			 try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
			 
			 System.out.println(forward.getPath());
		 }else if (command.equals("/step2/myhome.ads")){
			 action=new LoginUser();
			 try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
			 
			 System.out.println(forward.getPath());
		 }else if (command.equals("/step2/myregister.ads")){
			 action=new ViewUsers();
			 try{
					forward=action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
			 System.out.println(forward.getPath());
		 }
		 
		 
		 if(forward != null){			 	
				if(forward.isRedirect()){ // true
					response.sendRedirect(forward.getPath());
				}else{                    // false
					RequestDispatcher dispatcher =	request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}
		}
    }
    
	/**.
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProccess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProccess(request, response);
	}
    
}
