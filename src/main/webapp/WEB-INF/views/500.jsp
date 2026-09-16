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
        500 Server Error | KS Portfolio
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

            500

        </p>


        <h1 class="error-title">

            SERVER ERROR

        </h1>


        <p class="error-message">

            サーバー内部で問題が発生しました。
            時間をおいて再度アクセスしてください。

        </p>


        <div class="card error-card">


            <h3>

                処理を完了できませんでした

            </h3>


            <p>

                サーバー側で予期しないエラーが
                発生した可能性があります。

            </p>


            <p>

                問題が続く場合は、
                HOMEへ戻ってから再度操作してください。

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