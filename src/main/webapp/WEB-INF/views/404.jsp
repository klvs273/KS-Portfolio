<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isErrorPage="true" %>

<!DOCTYPE html>
<html lang="ja">

<head>

    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1.0">

    <title>404 Not Found | KS Portfolio</title>

    <link
        rel="stylesheet"
        href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

	<main class="main-content">

	    <section class="error-page">

	        <p class="section-label">
	            KS PORTFOLIO
	        </p>

	        <p class="error-code">
	            404
	        </p>

	        <h1 class="error-title">
	            PAGE NOT FOUND
	        </h1>

	        <p class="error-message">
	            お探しのページ、または作品が見つかりませんでした。
	            URLが変更されたか、存在しない可能性があります。
	        </p>

	        <div class="card error-card">

	            <p>
	                HOMEまたはWORKSから
	                ページを探してください。
	            </p>

	            <a
	                href="${pageContext.request.contextPath}/"
	                class="button">

	                HOMEへ戻る

	            </a>

	        </div>

	    </section>

	</main>

</body>
</html>