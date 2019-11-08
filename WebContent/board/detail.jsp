<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="/include/nav.jsp"%>

<!--================Blog Area =================-->
<section class="blog_area single-post-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<div class="main_blog_details">
					<a href="#"><h4>${board.title}</h4></a>
					<div class="user_details">
						<div class="float-left">
							<c:if test="${board.userId eq sessionScope.user.id}">
								<a href="/blog/board?cmd=updateForm&id=${board.id}">update</a>
								<a href="/blog/board?cmd=delete&id=${board.id}">delete</a>
							</c:if>
						</div>
						<div class="float-right">
							<div class="media">
								<div class="media-body">
									<h5>${board.user.username}</h5>
									<p>${board.createDate}</p>
								</div>
								<div class="d-flex">
									<img src="/blog/img/blog/user-img.jpg" alt="">
								</div>
							</div>
						</div>
					</div>
					<!-- 본문 시작 -->
					<p>${board.content}</p>
					<!-- 본문 끝 -->
					<hr />
				</div>

				<!-- 댓글 시작 -->
				<div class="comments-area" id="comments-area">

					<c:forEach var="comment" items="${comments}">


						<!-- 댓글 아이템 시작 -->
						<div class="comment-list" id="comment-id-${comment.id}">
							<!-- id 동적으로 만들기 -->

							<div class="single-comment justify-content-between d-flex">
								<div class="user justify-content-between d-flex">
									<div class="thumb">
										<img src="img/blog/c1.jpg" alt="">
									</div>
									<div class="desc">
										<h5>
											<a href="#">${comment.user.username}</a>
										</h5>
										<p class="date">${comment.createDate}</p>
										<p class="comment">${comment.content}</p>
									</div>
								</div>


								<div class="reply-btn">
									<button onClick="commentDelete(${comment.id})" class="btn-reply text-uppercase" style="display: inline-block; float: left; margin-right: 10px; height:35px;"><i class="fa fa-trash" style="font-size:21px; margin-top:5px; "></i></button>
									<button onClick="replyListShow(${comment.id})" class="btn-reply text-uppercase" style="display: inline-block; float: left; margin-right: 10px; height:35px;"><i class="fa fa-file" style="font-size:17px; "></i></button>
									<button onClick="replyForm(${comment.id})" class="btn-reply text-uppercase" style="height:35px;"><i class="fa fa-edit" style="font-size:18px; margin-top:5px;"></i></button>
								</div>

							</div>

							<!-- Reply 쓰기 -->

						</div>
						<!-- 댓글 아이템 끝 -->
					</c:forEach>
				</div>
				<!-- 댓글 끝 -->

				<!-- 댓글 쓰기 시작 -->
				<div class="comment-form" style="margin-top: 0px;">
					<h4 style="margin-bottom: 20px">Leave a Reply</h4>
					<form id="comment-submit">
						<input type="hidden" name="userId" value="${sessionScope.user.id }"> <input type="hidden" name="boardId" value="${board.id }">
						<div class="form-group">
							<textarea id="content" style="height: 60px" class="form-control mb-10" rows="2" name="content" placeholder="Messege" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'"
								required=""></textarea>
						</div>
						<button type="button" onClick="commentWrite()" class="primary-btn submit_btn">Post Comment</button>
					</form>
				</div>
				<!-- 댓글 쓰기 끝 -->
			</div>

			<div class="col-lg-2"></div>
		</div>
	</div>
</section>
<!--================Blog Area =================-->

<!--================ start footer Area  =================-->
<footer class="footer-area p_120">
	<div class="container">
		<div class="row">
			<div class="col-lg-3  col-md-6 col-sm-6">
				<div class="single-footer-widget">
					<h6 class="footer_title">About Us</h6>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore dolore magna aliqua.</p>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6">
				<div class="single-footer-widget">
					<h6 class="footer_title">Newsletter</h6>
					<p>Stay updated with our latest trends</p>
					<div id="mc_embed_signup">
						<form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="subscribe_form relative">
							<div class="input-group d-flex flex-row">
								<input name="EMAIL" placeholder="Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address '" required="" type="email">
								<button class="btn sub-btn">
									<span class="lnr lnr-arrow-right"></span>
								</button>
							</div>
							<div class="mt-10 info"></div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="single-footer-widget instafeed">
					<h6 class="footer_title">Instagram Feed</h6>
					<ul class="list instafeed d-flex flex-wrap">
						<li><img src="img/instagram/Image-01.jpg" alt=""></li>
						<li><img src="img/instagram/Image-02.jpg" alt=""></li>
						<li><img src="img/instagram/Image-03.jpg" alt=""></li>
						<li><img src="img/instagram/Image-04.jpg" alt=""></li>
						<li><img src="img/instagram/Image-05.jpg" alt=""></li>
						<li><img src="img/instagram/Image-06.jpg" alt=""></li>
						<li><img src="img/instagram/Image-07.jpg" alt=""></li>
						<li><img src="img/instagram/Image-08.jpg" alt=""></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-2 col-md-6 col-sm-6">
				<div class="single-footer-widget f_social_wd">
					<h6 class="footer_title">Follow Us</h6>
					<p>Let us be social</p>
					<div class="f_social">
						<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-dribbble"></i></a> <a href="#"><i class="fa fa-behance"></i></a>
					</div>
				</div>
			</div>
		</div>
		<div class="row footer-bottom d-flex justify-content-between align-items-center">
			<p class="col-lg-12 footer-text text-center">
				<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				Copyright &copy;
				<script>
					document.write(new Date().getFullYear());
				</script>
				All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
				<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			</p>
		</div>
	</div>
</footer>
<!--================ End footer Area  =================-->




<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/stellar.js"></script>
<script src="vendors/lightbox/simpleLightbox.min.js"></script>
<script src="vendors/nice-select/js/jquery.nice-select.min.js"></script>
<script src="vendors/isotope/imagesloaded.pkgd.min.js"></script>
<script src="vendors/isotope/isotope-min.js"></script>
<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
<script src="vendors/jquery-ui/jquery-ui.js"></script>
<script src="js/jquery.ajaxchimp.min.js"></script>
<script src="js/mail-script.js"></script>
<script src="js/theme.js"></script>

<!--================comment script =================-->
<script>
function commentWriteForm(id, username, content, createDate){
    var comment_list = "<div class='comment-list' id='comment-id-"+id+"'> ";
    comment_list += "<div class='single-comment justify-content-between d-flex'> ";
    comment_list += "<div class='user justify-content-between d-flex'> ";
    comment_list += "<div class='thumb'> <img src='img/blog/c1.jpg' alt=''> </div> ";
    comment_list += "<div class='desc'><h5><a href='#'>"+username+"</a></h5> ";
    comment_list += "<p class='date'>"+createDate+"</p><p class='comment'>"+content+"</p></div></div> ";
    comment_list += "<div class='reply-btn'>";
    comment_list += "<button onClick='commentDelete("+id+")' class='btn-reply text-uppercase' style='display:inline-block; float:left; margin-right:10px;'>삭제</button>";
    comment_list += "<button onClick='replyListShow("+id+")' class='btn-reply text-uppercase'  style='display:inline-block; float:left; margin-right:10px;'>보기</button>";
    comment_list += "<button onClick='replyForm("+id+")' class='btn-reply text-uppercase'>쓰기</button></div></div></div>";
    console.log(comment_list);
    return comment_list;
}
// comment쓰기
  function commentWrite(){
       var comment_submit_string = $("#comment-submit").serialize();
      console.log(comment_submit_string);
      $.ajax({
         method: "POST",
         url: "/blog/api/comment?cmd=write",
         data: comment_submit_string,
         contentType: "application/x-www-form-urlencoded; charset=utf-8",
         dataType:"json",
         success: function(result){
           
        	 //화면에 적용
               var comment_et = commentWriteForm(comment_id, comment.user.username, comment.content, comment.createDate);
               $("#comments-area").append(comment_et);
               //입력 폼 초기화
               $("#content").val("");
            
         },
         error: function(xhr){
            console.log(xhr.status);
         }
         
      }); 
      
   }

	//deleteComment 삭제.
	// 로그인 안했거나 본인이 쓴거 아니면 못지우게 해야한다.
	function commentDelete(comment_id){
		$.ajax({
			method : "POST",
		    url : "/blog/api/comment?cmd=delete",
		    data : comment_id+"",
		    contentType:"text/plain; charset=UTF-8",
		    success: function(result){
		    	console.log(result);
		    	// 해당 엘레멘트를 찾아 삭제하면 됨
		    	if(result==="ok"){    				    	
		    	$("#comment-id-"+comment_id).remove();
		    	}},
		    	
		    error:function(xhr){
		    	console.log(xhr.status);
		    }
		    
		});
	}
	
	function replyItemForm(id, username, content, createDate){
	      var replyItem = "<div class='comment-list left-padding' id = 'reply-id-"+id+"'>";
	      replyItem+= "<div class='single-comment justify-content-between d-flex'>";
	      replyItem+= "<div class='user justify-content-between d-flex'>";
	      replyItem+= "<div class='thumb'><img src='img/blog/c2.jpg' alt=''></div>";
	      replyItem+= "<div class='desc'><h5><a href='#'>"+username+"</a></h5>";
	      replyItem+= "<p class='date'>"+createDate+"</p>";
	      replyItem+= "<p class='comment'>"+content+"</p>";
	      replyItem+= "</div></div><div class='reply-btn'><button onClick='replyDelete("+id+")' class='btn-reply text-uppercase'>삭제</button>";
	      replyItem+= "</div></div></div>";
	      
	      return replyItem;
	   }
	
	// reply 보기 
	function replyListShow(comment_id) {
		$.ajax({
			method : "POST",
			url : "/blog/api/reply?cmd=list",
			data : comment_id+"",
			contentType:"text/plain; charset=UTF-8",
			dataType: "json",
			success: function(replys){
				for(reply of replys){
					// 잘 받았으면 화면에 표시하기
					console.log(reply);
					var reply_et = replyItemForm(reply.id, reply.user.username, reply.content, reply.createDate);
					$("#comment-id-"+reply.commentId).after(reply_et);					
				}
			},
			error: function(xhr){
				console.log(xhr)
			}
		})
	}
	//reply 삭제 만들기
	function replyDelete(reply_id){
		$.ajax({
			method : "POST",
		    url : "/blog/api/reply?cmd=delete",
			data : reply_id+"",
			contentType:"text/plain; charset=UTF-8",
			success:function(result){
				if(result==="ok"){
					// 해당 글 삭제
					$("#reply-id-"+reply_id).remove();
				}
			},
			error:function(){
				
			}
		});
	}

	// replyForm - 화면에 로딩
	   function replyForm(comment_id){
		   var comment_form_inner = "<h4 style='margin-bottom:20px'>Leave a Reply</h4><form id='reply-submit'><div class='form-group'><textarea style='height:60px' class='form-control mb-10' rows='2' name='content' placeholder='Messege' required=''></textarea></div><button class='primary-btn submit_btn'>Post Comment</button></form>";      
      //<div class="comment-form" style="margin-top:0px;"></div>
      var comment_form = document.createElement("div"); //div 빈 박스 생성
      comment_form.className = "comment-form"; //div에 클래스 이름을 주고
      comment_form.style = "margin-top:0px"; //div에 style을 준다.
      
      comment_form.innerHTML = comment_form_inner;
      console.log(comment_form);
      
      var comment_list = document.querySelector("#comment-id-"+comment_id);
      comment_list.append(comment_form); //after와 append, before와 prepend 
   }
	// 대댓글 replyWrite 작성하기
	
	function replyWrite(){
		$.ajax({
			method : "POST",
			url : "/blog/api/reply?cmd=write",
			data : 
		})
	}
</script>


</body>
</html>