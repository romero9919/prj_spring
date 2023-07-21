<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyMusic</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../../../../resources/css/mymusic.css">
    <script src="https://kit.fontawesome.com/b2daa60225.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="../../../../resources/js/mymusic.js"></script>
</head>
<body>
    <header>
        <div class="btnContainer">
            <div class="d-grid gap-2 d-md-block">
                <a href="mymusic"><button class="btn btn-secondary" type="button">Main</button></a>
                <a href="mymusicAi"><button class="btn btn-secondary" type="button">AI</button></a>
                <a href="mymusicWrite"><button class="btn btn-secondary" type="button">Write</button></a>
                <a href="#"><button class="btn btn-secondary" type="button">Notice</button></a>
            </div>
        </div>  
    </header>
    <div class="container">
        <div class="sub02Container">
            <select class="form-select" aria-label="Default select example">
                <option value="1" selected>요청</option>
                <option value="2">업로드</option>
                <option value="3">후기</option>
            </select>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>seq</th>
                        <th>title</th>
                        <th>writer</th>
                        <th>date</th>
                        <th>view</th>
                    </tr>
                </thead>
                <c:choose>
                	<c:when test="${fn:length(list) eq 0}">
                		등록된 게시글이 없습니다.
                	</c:when>
                	<c:otherwise>
	                	<c:forEach items="${list}" var="list" varStatus="status">
			                <tbody>
			                    <tr>
			                        <th><c:out value="${list.seq}"/></th>
			                        <th><a href="#"><c:out value="${list.header }"/></a></th>
			                        <th><c:out value="${list.writer }"/></th>
			                        <th><c:out value="${list.date }"/></th>
			                        <th><c:out value="${list.number }"/></th>
			                    </tr>
			                </tbody>	
		                </c:forEach>
	                </c:otherwise>
                </c:choose>
            </table>
            <c:if test="${vo.startPage gt vo.pageNumToShow}">
                      <li>
                        <button
                          class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple"
                        >
                          <a class="page-link" href="javascript:goList(${vo.startPage - 1})">
                          1
                         </a>
                        </button>
                      </li>
                      </c:if>
                      <c:forEach begin="${vo.startPage}" end="${vo.endPage}" varStatus="i">
							<c:choose>
								<c:when test="${i.index eq vo.thisPage}">
						                <li class="page-item active"><a class="page-link" href="javascript:goList(${i.index})">${i.index}</a></li>
								</c:when>
								<c:otherwise>             
						                <li class="page-item"><a class="page-link" href="javascript:goList(${i.index})">${i.index}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>                
						<c:if test="${vo.endPage ne vo.totalPages}">                
						                <li class="page-item"><a class="page-link" href="javascript:goList(${vo.endPage + 1})"><i class="fa-solid fa-angle-right"></i></a></li>
						</c:if>
             <form name="formList" method="get" class="flex justify-content-center align-items-center"><!-- post-get 간 변경 가능 -->
	            <input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
				<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
		          <select class="form-select" aria-label="typeSelect" name="shOption">
		             <option value="1">제목</option>
		          </select>
		          <div id="searchBox">
		             <label class="form-label"></label>
		             <input type="text" class="form-control" id="searchForm" aria-describedby="searchForm" name="shKeyword" placeholder="search" value="<c:out value="${vo. shKeyword }"/>" >
		          </div>
		          <button type="button" class="btn btn-primary" id="btnSubmit">Submit</button>
		       </form>
            <a href="mymusicWrite"><button type="button" class="btn btn-primary" id="writeBtn">글쓰기</button></a>
        </div>
    </div>
    <div class="mypage">
        <a href="#">
            <div class="mypageModal">
                    <i class="fa-solid fa-user"></i>
            </div>  
        </a>
        <div class="mypageContent">
            <div class="row g-3 align-items-center">
                <div class="form-floating mb-3">
                    <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                    <label for="floatingInput">Email</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
                    <label for="floatingPassword">Password</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="1" id="accountSave">
                    <label class="form-check-label" for="flexCheckDefault">
                        계정을 저장합니다
                    </label>
                </div>
                <button type="button" class="btn btn-primary" id="loginBtn">LOGIN</button>
                <button type="button" class="btn btn-info" id="signinBtn">SIGN IN</button>
            </div>
        </div>
    </div>
    <script>
	    $("#btnSubmit").on("click", function(){
	        
	        $("form[name=formList]").attr("method", "get");
	        $("form[name=formList]").attr("action", "/myMusicNoticeList").submit();
	        
	        
	     });
	     
	     
	     goList = function(thisPage) {
	 		$("input:hidden[name=thisPage]").val(thisPage);
	 		$("form[name=formList]").attr("action", "/codeGroupList").submit();
	     }
    </script>
</body>
</html>