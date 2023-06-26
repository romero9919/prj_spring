<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CodeGroupForm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    <style>
    .mainCont{
        width: 950px;
        height: 400px;
        margin: auto;
        display: flex;
        box-sizing: border-box;
        margin-top: 100px;
        justify-content: center;
        padding-top: 80px;
        background-color: rgba(0, 0, 0, .1);
        border-radius: 10px;
    }

    </style>

</head>
<body>
    <div class="container">
        <div class="mainCont">
            <form>
                <div class="mb-3">
                    <label for="seqform" class="form-label">seq</label>
                    <input type="text" class="form-control" id="seqform" aria-describedby="nameForm">
                </div>
                <div class="mb-3">
                    <label for="nameform" class="form-label">name</label>
                    <input type="text" class="form-control" id="nameform" aria-describedby="nameForm">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>  
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>