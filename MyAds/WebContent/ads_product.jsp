
	<%@page import="myads.model.util.AESCrypt"%>
<%@page import="myads.model.dto.PostingDto"%>
<jsp:directive.include file="ads_header.jsp" />
	<jsp:directive.include file="ads_help2.jsp" />
	<%
		List<PostingDto> listProdict=(List<PostingDto>) request.getSession().getAttribute("productByCategory");
		List<MainCategoryDto> listSubCategory=(List<MainCategoryDto>) request.getSession().getAttribute("CategoryList");
	%>
	<!-- body_section -->
	<div class="body_section">
		<!-- cnt_wrap -->
		<div class="cnt_wrap">
			<!-- body_cnt -->
			<div class="body_cnt">
				<div class="tit_detail">
					<!-- title -->
					<div class="title f_left">
						<h2>BETTER SHOPPING</h2>
						<p class="space"><strong>Store <span>No. 1315520</span></strong></p>
					</div>
					<!-- //title -->

					<!-- advertise -->
					<div class="adv f_right">
						<a href="#none"><img src="img/adv/metfone.gif" alt="metfone"></a>
					</div>
					<!-- //advertise -->
				</div>

				<!-- container -->
				<div class="container">
					<div class="step">
						<span><a href="#none">Home</a> > </span>
						<span><a href="#none">Store Home</a> > </span>
						<span><a href="#none">Products</a> > </span>
						<span><a href="#none">May</a></span>
					</div>
					<!-- cnt -->
					<div class="cnt cboth" style="padding-left:220px;padding-right:200px;">
						<!-- lbn_cnt -->
						<div class="lbn_cnt">
							<!-- navigation -->
							<div class="nav">
								<h3 class="storecate">Store Categories
									<!--<a href="#none" class="allcate on"><span class="blind">all categories</span></a>-->
									<a href="javascript:" class="allcate"><span class="blind">all categories</span></a>
									<!-- lbn -->
									<div class="lbn">
										<dl>
											<dt><strong>CATEGORIES</strong>&nbsp;See all ></dt>
												
												<%
													/* List<MainCategoryDto> rst=CategoryDao.getCategory();
												    List<SubCategoryDto> rst1=CategoryDao.getSubCategory(); */
													for(int j=0;j<rst.size();j++){
												%>
													<dd><a href="mycategory.ads?id=<%=AESCrypt.encrypt(String.valueOf(rst.get(j).getId())) %>" class="<%= rst.get(j).getIco_cls_name() %>"><%= rst.get(j).getName() %></a>
														<div class="more">
															<ul>
																<%
												                	for(int i=0;i<rst1.size();i++)  {  
												                		if (rst.get(j).getId()==rst1.get(i).getId()){
																%>
																	<li><a href="mycategory.ads?id=<%=AESCrypt.encrypt(String.valueOf(rst.get(j).getId())) %>&subid=<%=AESCrypt.encrypt(String.valueOf(rst1.get(i).getId())) %>" target="_blank"><%= rst1.get(i).getName() %></a></li>
																<%
																     }
												                	}
																 %>
															</ul>
														</div>
													</dd>
												<%
													}
												%>        
										</dl>
									</div>
									<!-- //lbn -->
								</h3>
								<div class="item" id="subCategoryList">
									<dl>
										<dt><a href="./mycategory.ads?id=<%=AESCrypt.encrypt(String.valueOf(listSubCategory.get(0).getId())) %>" role="<%=listSubCategory.get(0).getId() %>">
											<%=listSubCategory.get(0).getName() %>
											
										</a></dt>
										<dd>
											<ul>
												<%
													for(int i=0;i<listSubCategory.size();i++){
												%>
													<li><a href="./mycategory.ads?id=<%=AESCrypt.encrypt(String.valueOf(listSubCategory.get(0).getId())) %>&subid=<%=AESCrypt.encrypt(String.valueOf(listSubCategory.get(i).getSubcategory().getId())) %>" role="<%=listSubCategory.get(i).getSubcategory().getId()%>"><%=listSubCategory.get(i).getSubcategory().getName() %></a></li>
												<%
													}
												%>
											</ul>
										</dd>
									</dl>
								</div>
							</div>
							<!-- //navigation -->

							<!-- adv -->
							<div class="adv mgt20">
								<img src="img/adv/adv_detail01.png" alt="">
							</div>
							<!--// adv -->
						</div>
						<!-- lbn_cnt -->

						<!-- lbn_cnt -->
						<div class="rbn_cnt">
							<div class="adv mgt20">
								<img src="img/com/com_pro3.png" alt="" style="width:200px;">
							</div>
							<div class="adv mgt20">
								<img src="img/com/com_pro3.png" alt="" style="width:200px;">
							</div>
							<div class="adv mgt20">
								<img src="img/com/com_pro3.png" alt="" style="width:200px;">
							</div>
							<div class="adv mgt20">
								<img src="img/com/com_pro3.png" alt="" style="width:200px;">
							</div>
							<div class="adv mgt20">
								<img src="img/com/com_pro3.png" alt="" style="width:200px;">
							</div>
							<div class="adv mgt20">
								<img src="img/com/com_pro3.png" alt="" style="width:200px;">
							</div>
							<div class="adv mgt20">
								<img src="img/com/com_pro3.png" alt="" style="width:200px;">
							</div>
						</div>
						<!-- lbn_cnt -->

						<!-- ccnt_cnt -->
						<div class="cbn_cnt">
							<!-- table product3 -->
							<div class="tbl_product3">
								<!------------------------------------------- open ----------------------------------------------------------------------------- -->
								<ul>
									<%
										for(int i=0;i<listProdict.size();i++){
									%>
									<li>
										<a href="#none">
											<img src="uploads/<%=listProdict.get(i).getImage().getImage() %>" alt="" style="width:236px;height:250px;">
											<p class="title"><%=listProdict.get(i).getTitle() %></p>
											<p><%=listProdict.get(i).getKey() %></p>
										</a>
										<dl>
											<dd><strong>US $<%=listProdict.get(i).getPrice() %></strong>/price</dd>
										</dl>
									</li>
									<%
										}
									%>
								</ul>
								<!------------------------------------------- close ----------------------------------------------------------------------------- -->
							
							</div>
							<!-- //table product3 -->

							<!-- Paging wrap -->
							<div class="paging_wrap mgt30">
								<!-- pagination -->
								<div class="paging"><!-- 비활성상태는 on class 제거 -->
									<a href="#none" class="btn_pag_cntr first"><span class="blind">first</span></a><a href="#none" class="btn_pag_cntr prev"><span class="blind">previous</span></a>
									<span class="pag_num">
										<a href="#none" class="on">1</a><a href="#none">2</a><a href="#none">3</a><a href="#none">4</a><a href="#none">5</a><a href="#none">6</a><a href="#none">7</a><a href="#none">8</a><a href="#none">9</a><a href="#none">10</a>
									</span>
									<a href="#none" class="btn_pag_cntr next on"><span class="blind">next</span></a><a href="#none" class="btn_pag_cntr last on"><span class="blind">last</span></a>
								</div> 
								<!-- //pagination -->
								
							</div>
							<!-- //Paging wrap -->

							<!-- related_products -->
							<div class="related_pro mgt30">
								<script	type="text/javascript">
									jQuery(document).ready(
									function()
									{
										//-----------------------------------------
										$("#slider-carousel").carousel({activate: function(){},	timerAnimSlide:400,	infinite:true, resizeItem:{width:100}, responsive:{minWidth:645}});
										$("#slider-carousel-2").carousel({activate:	function(){}, timerAnimSlide:400, infinite:true, resizeItem:{width:50},	responsive:{minWidth:645}});
										
										//-----------------------------------------
									});
								</script>
								<h3>Related Products</h3>
								<div class="center">
									<div class="wrapper-center">
										<div id="slider-carousel-2">
											<div class="wrapper-setas">
												<a href="#"	class="seta-dir	setaDir"><em class="sprite seta-pag-dir-md"></em></a>
												<a href="#"	class="seta-esq	setaEsq"><em class="sprite seta-pag-esq-md"></em></a>
												
												<div class="clear"></div>
											</div>
											<div id="container-slider-carousel-2" class="container">
												<div id="content-silder-carousel-2"	class="content">
													<div class="wrapper-itens">
														<div class="item_related">
															<a href="#none">
																<span><img src="img/com/lorempixel.jpg" alt="" class="img-responsive"></span>
																<dl>
																	<dt>Saling</dt>
																	<dd>10$</dd>
																	<dd>Dresses Office Wear Women Work Outfits Women Work Outfits</dd>
																</dl>
															</a>
														</div>
														<div class="item_related">
															<a href="#none">
																<span><img src="img/com/lorempixel-1.jpg" alt="" class="img-responsive"></span>
																<dl>
																	<dt>Saling</dt>
																	<dd>10$</dd>
																	<dd>Dresses Office Wear Women Work Outfits Women Work Outfits</dd>
																</dl>
															</a>
														</div>
														<div class="item_related">
															<a href="#none">
																<span><img src="img/com/lorempixel-2.jpg" alt="" class="img-responsive"></span>
																<dl>
																	<dt>Saling</dt>
																	<dd>10$</dd>
																	<dd>Dresses Office Wear Women Work Outfits Women Work Outfits</dd>
																</dl>
															</a>
														</div>
														<div class="item_related">
															<a href="#none">
																<span><img src="img/com/lorempixel-3.jpg" alt="" class="img-responsive"></span>
																<dl>
																	<dt>Saling</dt>
																	<dd>10$</dd>
																	<dd>Dresses Office Wear Women Work Outfits Women Work Outfits</dd>
																</dl>
															</a>
														</div>
														<div class="item_related">
															<a href="#none">
																<span><img src="img/com/com_pro3.png" alt="" class="img-responsive"></span>
																<dl>
																	<dt>Saling</dt>
																	<dd>10$</dd>
																	<dd>Dresses Office Wear Women Work Outfits Women Work Outfits</dd>
																</dl>
															</a>
														</div>
														<div class="item_related">
															<a href="#none">
																<span><img src="img/com/com_pro3.png" alt="" class="img-responsive"></span>
																<dl>
																	<dt>Saling</dt>
																	<dd>10$</dd>
																	<dd>Dresses Office Wear Women Work Outfits Women Work Outfits</dd>
																</dl>
															</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- //related_products -->
						</div>
						<!-- ccnt_cnt -->
					</div>
					<!-- //cnt -->
					<a href="#none" class="btn_gotop"><span class="blind">gotop</span></a>
				</div>
				<!-- //container -->
			</div>
			<!-- //body_cnt -->
		</div>
		<!-- //cnt_wraps -->
	</div>
	<!-- //body_section -->
	<script>
		$(document).ready(function(e){
			$("#subCategoryList ul li a").click(function(e){
				var categoryId=$(this).parents("dd").prev("dt").find("a").attr("role");
				var subcategoryId=$(this).attr("role");
			});
			
		});
	</script>
	<jsp:directive.include file="ads_footer.jsp" />
