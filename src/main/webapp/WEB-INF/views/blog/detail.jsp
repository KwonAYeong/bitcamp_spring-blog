<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>detail</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style>
        div {
            border: 1px solid black;}
    </style>
</head>
<body>
    <div class="container">
        <div class="row first-row">
            <div class="col-sm">
                글번호
            </div>
            <div class="col-sm">
                ${blog.blogId}
            </div>
            <div class="col-sm">
                글제목
            </div>
            <div class="col-sm">
                ${blog.blogTitle}
            </div>
            <div class="col-sm">
                작성자
            </div>
            <div class="col-sm">
                ${blog.writer}
            </div>
            <div class="col-sm">
                조회수
            </div>
            <div class="col-sm">
                ${blog.blogCount}
            </div>
        </div>  <!-- .first-row-->

        
        <div class="row second-row">
            <div class="col-sm-1">
                작성일
            </div>

            <div class="col-sm-5">
                ${blog.publishedAt}
            </div>

            <div class="col-sm-1">
                수정일
            </div>

            <div class="col-sm-5">
                ${blog.updatedAt}
            </div>
        </div> <!-- .row second-->


        <div class="row third row">
            <div class="col-sm-1">
                본문
            </div>

            <div class="col-sm-11">
                ${blog.blogContent}
            </div>
        </div> <!-- .row third -->


        <div class="row fourth-row">
            <div class="col">
                <a href="/blog/list"><button class="btn btn-outline-secondary">목록으로</button> </a>
            </div>
            <div class="col">
                <form action="/blog/delete" method="POST">
                    <input type="hidden" name="blogId" value="${blog.blogId}">
                    <input type="submit" value="삭제하기" class="btn btn-outline-warning">
                </form>
            </div>
            <div class="col">
                <form action="/blog/updateform" method="POST">
                    <input type="hidden" name="blogId" value="${blog.blogId}">
                    <input type="submit" value="수정하기" class="btn btn-outline-info">
                </form>
            </div>
        </div> <!-- .row fourth -->
        <div class="row">
            <div id="replies">

            </div>
        </div>
    </div>   <!-- .container -->
<script>
    // 글 구성에 필요한 글번호를 JS 내부에 저장.
    let blogId = "${blog.blogId}";

    // blogId를 받아 전체 데이터를 JS 내부로 가져오는 함수.
    function getAllReplies(blogId) {
        // <%-- jsp와 js가 모두 ${변수명} 문법을 공유하고, 이 중 .jsp파일에서는
        // ${}의 해석을 jsp식으로 먼저 하기 때문에, 해당 ${}가 백틱 내부에서 쓰이는 경우
        // \${} 형식으로 \를 추가로 왼쪽에 붙여서 jsp용으로 작성한 것이 아님을 명시해야함. --%>
        let url = `http://localhost:8080/reply/\${id}/all`;

        let str = ""; // 받아온 json을 표현할 html 코드를 저장할 문자열 str 선언

        fetch(url, {method:'get'}) // get방식으로 위 주소에 요청넣기
            .then((res) => res.json())// 응답받은 요소중 json만 뽑기
            .then(replies => { // 뽑아온 json으로 처리작업하기
                console.log(replies);

                //for(reply of replies){
                //    console.log(reply);
                //    console.log("---------");
                //    str += `<h3>글쓴이: \${reply.replyWriter},
                //        댓글내용: \${reply.replyContent}</h3>`;
                //}

                // .map()을 이용한 간결한 반복문 처리
                replies.map((reply, i) => { // 첫 파라미터 : 반복대상자료, 두번째 파라미터 : 순번
                    str += `<h3>\${i+1}번째 댓글 || 글쓴이: \${reply.replyWriter},
                                댓글내용: \${reply.replyContent}
                                    <span class="deleteReplyBtn" data-replyId="\${reply.replyId}">
                                        [삭제]
                                    </span>
                                </h3>`;
                });


                console.log(str);// 저장된 태그 확인
                // #replies 요소를 변수에 저장해주세요.
                const $replies = document.getElementById('replies');
                // 저장된 #replies의 innerHTML 에 str을 대입해 실제 화면에 출력되게 해주세요.
                $replies.innerHTML = str;
            });
    }
</script>
</body>
</html>