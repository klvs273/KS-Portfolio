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

    <title>
        400 Bad Request | KS Portfolio
    </title>

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

            400

        </p>


        <h1 class="error-title">

            BAD REQUEST

        </h1>


        <p class="error-message">

            リクエストの内容を処理できませんでした。
            URLや作品IDが正しくない可能性があります。

        </p>


        <div class="card error-card">


            <h3>

                リクエストを確認してください

            </h3>


            <p>

                URLの入力内容や、
                指定されたパラメータに誤りがないか
                確認してください。

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