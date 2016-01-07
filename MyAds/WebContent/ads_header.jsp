<!-- saved from url=(0014)about:internet -->
<!doctype html>
<%@page import="myads.model.dto.MemberDto"%>
<%@page import="myads.model.dto.SubCategoryDto"%>
<%@page import="myads.model.dao.CategoryDao"%>
<%@page import="myads.model.dto.MainCategoryDto"%>
<%@page import="java.util.List"%>
<%@page import="myads.model.sqlConnection.SqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="myads.model.dao.MyComobox"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<html>
<head>
<title>WeCare</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=yes,target-densityDpi=medium-dpi">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="css/pc_reset.css">
<link rel="stylesheet" href="css/select_box.css"/>
<link rel="stylesheet" href="css/pc_ban.css">
<link rel="stylesheet" href="css/pc_slider.css">
<link rel="stylesheet" href="css/pc_com.css">

<script src="js/lib.js"></script>
<script src="js/jssor.js"></script>
<script src="js/banner.js"></script>
<script src="js/banner1.js"></script>
<script src="js/select_box.js"></script>
<script src="js/select_box1.js"></script>
<script src="js/comon.js"></script>

<script src="js/jquery.touchSwipe.min.js"></script>
<script src="js/jquery.easing.1.3.min.js"></script>
<script src="js/infinite-slider-min.js"></script>

<style type="text/css">
	.product-views{
		float:right;
		display: block;
		margin: 10px;
	}
</style>
 
 <script>
		$(function(){
		
			$(".slider-wrapper").infiniteSlider({
				animateType   : false,
				autoPlaySpeed : 3000,
				btnsText      : {
					next      : "",
					prev      : "",
					pause     : "",
					play      : ""
				},
				hoverPause    : true,
				navigation    : true,
				responsive    : false,
				speed         : "normal",
				swipe         : true,
				swipeLimit    : 50,
				width         : "359px"
			});
		});
		
	</script>

<script src="js/comon.js"></script>

</head>

<body>

<!-- wrap -->
<div class="wrap">

	<!-- head_section -->
	<div class="head_section">
		<!-- head_cnt -->
		<div class="head_cnt">
			<!-- logo -->
			<h1 class="logo"><a href="./"><span class="blind">MyAds</span></a></h1>
			<!-- //logo -->

			<!-- find_opt -->
			<div class="find_opt">
				<div class="opt cboth">
					<ul>
						<li>
							<div class="search"><input type="text" placeholder="I'm looking for..."></div>
						</li>
						<li>
							<div class="myselect">
								<form action="">
									<div class="example_1">
										<select name="" id="demo-select_1" style="width:100%;height:37px;cursor:pointer;border:0;">
											<option value="0" data-modifier="mod">All Categories</option>
												<%
												    CategoryDao category=new CategoryDao();
													List<MainCategoryDto> rst=category.getCategory();
												    List<SubCategoryDto> rst1=category.getSubCategory();
													for(int j=0;j<rst.size();j++){
												%>
												<optgroup label="<%= rst.get(j).getName() %>">
															<%
											                	for(int i=0;i<rst1.size();i++)  {  
											                		if (rst.get(j).getId()==rst1.get(i).getId()){
															%>
															<option value="<%= rst1.get(i).getSubid() %>"><%= rst1.get(i).getName() %></option>
															<%
															     }
											                	}
															 %>
												</optgroup>
												<%
												     }
												%>
										</select>


									</div>
								</form>
							</div>
						</li>
						<li>
							<div class="myselect">
								<form action="">
									<div class="example_1">
										<select name="" id="demo-select_1" style="width:100%;height:37px;cursor:pointer;border:0;">
												<option value="0" data-modifier="mod">All Locations</option>
												<%
													ResultSet rs=MyComobox.getProvince();
													while(rs.next()){
												%>
												<option value="<%= rs.getString("ProvId") %>"><%= rs.getString("ProvName") %></option>
												<%
													}
												%>
										</select>
									</div>
								</form>
							</div>
						</li>
					</ul>

					<a href="#none" class="btn_search"><span class="blind">search</span></a>
					
					<% if(session.getAttribute("user") == null ){ %>
					 	<a href="lay_log.ads" class="btn_post_free"><span class="blind">Post Free Ads</span></a>
					 <% } else {%>
					 	<a href="lay_myadspages.ads" class="btn_post_free"><span class="blind">Post Free Ads</span></a>
					 <%} %>
					 
					 <%
					 	MemberDto member=new MemberDto();
					 	member=(MemberDto)session.getAttribute("user");
					 %>
					 
					 <div class="welcomebox">
					 	<p>
					 		<% if(session.getAttribute("user") == null ){ %>
								<span class="welcome"></span>
								<a href="#none">Free Join</a> |
							 	<a href="#none">Free Sale</a> |
							 	<a href="#none">Free Buy</a>
							 <% } else {%>
							 	<a href="lay_myadsprofile.ads" style="color:#128609;"><strong>Hi</strong> <%= member.getName() %></a>|
							 	<a href="logout.ads" class="btn_logout" style="color:#f91339;">Log Out</a>|
							 	<a href="#none">Free Join</a> |
							 	<a href="#none">Free Sale</a> |
							 	<a href="#none">Free Buy</a>
							 <%} %>
					 	</p>
					 </div>
				</div>
			</div>
			<!-- //find_opt -->

			<!-- member -->
			<div class="member">
				<ul>
					<li><a href="lay_log.ads">Login</a></li>
					<li><a href="lay_reg.ads">Register</a></li>
					 <li><a href="lay_myadspages.ads">MyAdspages</a></li>
				</ul>
			</div>
			<!-- //member -->
		</div>
		<!-- //head_cnt -->
	</div>
	<!-- //head_section -->

