<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="java.net.URI" %>

<%@ page import="model.Work" %>
<%@ page import="model.WorkImage" %>
<%@ page import="util.HtmlUtil" %>

<%!
    /*
     * GitHub / DEMOなどの外部URLは
     * http / https のみ許可する
     */
    private boolean isSafeHttpUrl(String value) {

        if (value == null
                || value.isBlank()) {
            return false;
        }

        try {
            URI uri =
                URI.create(value.trim());

            String scheme =
                uri.getScheme();

            return (
                "http".equalsIgnoreCase(scheme)
                || "https".equalsIgnoreCase(scheme)
            )
            && uri.getHost() != null;

        } catch (IllegalArgumentException e) {
            return false;
        }
    }
%>

<%
    // ==================================================
    // Servletから受け取ったデータ
    // ==================================================

    List<Work> works =
        (List<Work>) request.getAttribute("works");

    Work selectedWork =
        (Work) request.getAttribute("selectedWork");

    List<WorkImage> workImages =
        (List<WorkImage>) request.getAttribute("workImages");

    String currentPage =
        (String) request.getAttribute("currentPage");

    if (currentPage == null
            || currentPage.isBlank()) {
        currentPage = "home";
    }
%>

<!DOCTYPE html>
<html lang="ja">

<head>

    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1.0">

    <title>KS Portfolio</title>

    <meta
        name="description"
        content="KS Java Web Development Portfolio">

    <link
        rel="stylesheet"
        href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>


<!-- ==================================================
     HEADER
================================================== -->

<header class="header">

    <div class="logo">

        <a
            href="?page=home"
            data-page="home">

            KS

        </a>

    </div>


    <nav class="nav">

        <a
            href="?page=home"
            data-page="home"
            class="<%= "home".equals(currentPage)
                    ? "active"
                    : "" %>">

            HOME

        </a>


        <a
            href="?page=about"
            data-page="about"
            class="<%= "about".equals(currentPage)
                    ? "active"
                    : "" %>">

            ABOUT

        </a>


        <a
            href="?page=skills"
            data-page="skills"
            class="<%= "skills".equals(currentPage)
                    ? "active"
                    : "" %>">

            SKILLS

        </a>


        <a
            href="?page=works"
            data-page="works"
            class="<%= (
                    "works".equals(currentPage)
                    || "detail".equals(currentPage)
                )
                    ? "active"
                    : "" %>">

            WORKS

        </a>


        <a
            href="?page=learning"
            data-page="learning"
            class="<%= "learning".equals(currentPage)
                    ? "active"
                    : "" %>">

            LEARNING

        </a>


        <a
            href="?page=system"
            data-page="system"
            class="<%= "system".equals(currentPage)
                    ? "active"
                    : "" %>">

            SYSTEM

        </a>


        <a
            href="?page=contact"
            data-page="contact"
            class="<%= "contact".equals(currentPage)
                    ? "active"
                    : "" %>">

            LINKS

        </a>

    </nav>

</header>


<!-- ==================================================
     MAIN
================================================== -->

<main class="main-content">


<!-- ==================================================
     HOME
================================================== -->

<section
    id="home"
    class="page hero
    <%= "home".equals(currentPage)
            ? "active-page"
            : "" %>">

    <div class="hero-content">

        <p class="hero-label">
            SYSTEM ENGINEER PORTFOLIO
        </p>

        <h1>
            KS
        </h1>

        <h2>
            Java Web Development
        </h2>

        <p class="hero-description">
            Java / Servlet / JSP / JDBC / MySQL
        </p>

        <p>
            Javaを中心としたWebアプリケーション開発、
            データベース、サーバー技術について
            学習・制作しています。
        </p>


        <div class="hero-buttons">

            <button
                type="button"
                class="button page-button"
                data-page="works">

                VIEW WORKS

            </button>


            <button
                type="button"
                class="button button-secondary page-button"
                data-page="about">

                ABOUT ME

            </button>

        </div>

    </div>


    <div class="system-status card">

        <p class="section-label">
            SYSTEM STATUS
        </p>

        <h3>
            Portfolio Application
        </h3>

        <p>
            ● ONLINE
        </p>


        <dl>

            <div>
                <dt>Backend</dt>
                <dd>Java</dd>
            </div>

            <div>
                <dt>Controller</dt>
                <dd>Servlet</dd>
            </div>

            <div>
                <dt>View</dt>
                <dd>JSP</dd>
            </div>

            <div>
                <dt>Database</dt>
                <dd>MySQL</dd>
            </div>

            <div>
                <dt>Database Access</dt>
                <dd>JDBC</dd>
            </div>

            <div>
                <dt>Server</dt>
                <dd>Apache Tomcat</dd>
            </div>

            <div>
                <dt>Deployment</dt>
                <dd>Railway / Docker</dd>
            </div>

        </dl>

    </div>

</section>


<!-- ==================================================
     ABOUT
================================================== -->

<section
    id="about"
    class="page
    <%= "about".equals(currentPage)
            ? "active-page"
            : "" %>">

    <p class="section-label">
        PROFILE
    </p>

    <h2>
        ABOUT
    </h2>


    <div class="about-layout">

        <div class="card">

            <h3>
                About Me
            </h3>

            <p>
                IT分野への理解を深めるため、
                Javaを中心としたWebアプリケーション開発や、
                データベース、Linux、ネットワーク、
                セキュリティについて幅広く学んでいます。
            </p>

            <p>
                これまでにServlet・JSP・JDBC・MySQLを使用した
                タスク管理システムや、
                Excel VBAを活用した請求書管理システムを制作しました。
            </p>

            <p>
                単にコードを書くことだけでなく、
                エラーの原因を切り分け、
                調査・修正を重ねながら
                システムを完成させることを大切にしています。
            </p>

        </div>


        <div class="card">

            <h3>
                Current Goal
            </h3>

            <p>
                プログラミングだけでなく、
                データベース・サーバー・ネットワークなど、
                システム全体を理解できる
                エンジニアを目指しています。
            </p>

            <p>
                開発だけでなく、
                問題の原因を切り分け、
                改善方法を考えながら、
                システムを安定して運用できる力も
                身につけていきたいと考えています。
            </p>

        </div>

    </div>


    <button
        type="button"
        class="button page-button"
        data-page="skills">

        VIEW SKILLS

    </button>

</section>


<!-- ==================================================
     SKILLS
================================================== -->

<section
    id="skills"
    class="page
    <%= "skills".equals(currentPage)
            ? "active-page"
            : "" %>">

    <p class="section-label">
        TECHNOLOGY
    </p>

    <h2>
        SKILLS
    </h2>

    <p>
        学習および制作・公開環境で使用している技術です。
    </p>


    <div class="skill-grid">


        <div class="card">

            <p class="card-number">
                01
            </p>

            <h3>
                Backend
            </h3>

            <p>
                Java<br>
                Servlet<br>
                JSP<br>
                PHP
            </p>

        </div>


        <div class="card">

            <p class="card-number">
                02
            </p>

            <h3>
                Frontend
            </h3>

            <p>
                HTML<br>
                CSS<br>
                JavaScript
            </p>

        </div>


        <div class="card">

            <p class="card-number">
                03
            </p>

            <h3>
                Database
            </h3>

            <p>
                MySQL<br>
                SQL<br>
                JDBC
            </p>

        </div>


        <div class="card">

            <p class="card-number">
                04
            </p>

            <h3>
                Server
            </h3>

            <p>
                Apache Tomcat<br>
                Apache HTTP Server<br>
                Linux
            </p>

        </div>


        <div class="card">

            <p class="card-number">
                05
            </p>

            <h3>
                Automation
            </h3>

            <p>
                Google Apps Script<br>
                VBA
            </p>

        </div>


        <div class="card">

            <p class="card-number">
                06
            </p>

            <h3>
                Development / Deployment
            </h3>

            <p>
                Git<br>
                GitHub<br>
                Docker<br>
                Railway<br>
                WordPress
            </p>

        </div>

    </div>


    <button
        type="button"
        class="button page-button"
        data-page="works">

        VIEW WORKS

    </button>

</section>


<!-- ==================================================
     WORKS
================================================== -->

<section
    id="works"
    class="page
    <%= "works".equals(currentPage)
            ? "active-page"
            : "" %>">

    <p class="section-label">
        DEVELOPMENT
    </p>

    <h2>
        WORKS
    </h2>

    <p>
        制作したWebアプリケーションや
        業務自動化システムを掲載しています。
    </p>


    <div class="works-grid">

        <%
            if (works != null
                    && !works.isEmpty()) {

                for (Work work : works) {
        %>


        <article class="card work-card">


            <%
                if (work.getImageUrl() != null
                        && !work.getImageUrl().isBlank()) {
            %>

            <div class="work-image-wrapper">

                <img
                    src="<%= request.getContextPath() %>/<%= HtmlUtil.escape(work.getImageUrl()) %>"
                    alt="<%= HtmlUtil.escape(work.getTitle()) %>"
                    class="work-image">

            </div>

            <%
                }
            %>


            <div class="work-content">

                <h3>
                    <%= HtmlUtil.escape(work.getTitle()) %>
                </h3>


                <p class="technology">
                    <%= HtmlUtil.escape(work.getTechnologies()) %>
                </p>


                <p>
                    <%= HtmlUtil.escape(work.getDescription()) %>
                </p>


                <div class="work-links">

                    <a
                        href="<%= request.getContextPath() %>/?page=detail&id=<%= work.getId() %>"
                        class="button button-secondary">

                        VIEW DETAIL

                    </a>


                    <%
                        if (isSafeHttpUrl(
                                work.getGithubUrl())) {
                    %>

                    <a
                        href="<%= HtmlUtil.escape(work.getGithubUrl()) %>"
                        target="_blank"
                        rel="noopener noreferrer"
                        class="button">

                        GitHub

                    </a>

                    <%
                        }
                    %>


                    <%
                        if (isSafeHttpUrl(
                                work.getDemoUrl())) {
                    %>

                    <a
                        href="<%= HtmlUtil.escape(work.getDemoUrl()) %>"
                        target="_blank"
                        rel="noopener noreferrer"
                        class="button">

                        DEMO

                    </a>

                    <%
                        }
                    %>

                </div>

            </div>

        </article>


        <%
                }

            } else {
        %>


        <div class="card">

            <h3>
                NO PROJECTS
            </h3>

            <p>
                現在、制作物を準備しています。
            </p>

        </div>


        <%
            }
        %>

    </div>

</section>


<!-- ==================================================
     PROJECT DETAIL
================================================== -->

<section
    id="detail"
    class="page
    <%= "detail".equals(currentPage)
            ? "active-page"
            : "" %>">

    <%
        if (selectedWork != null) {
    %>


    <p class="section-label">
        PROJECT DETAIL
    </p>

    <h2>
        <%= HtmlUtil.escape(
                selectedWork.getTitle()) %>
    </h2>


    <div class="project-detail">


        <%
            if (selectedWork.getImageUrl() != null
                    && !selectedWork.getImageUrl().isBlank()) {
        %>

        <div class="project-detail-image">

            <img
                src="<%= request.getContextPath() %>/<%= HtmlUtil.escape(selectedWork.getImageUrl()) %>"
                alt="<%= HtmlUtil.escape(selectedWork.getTitle()) %>">

        </div>

        <%
            }
        %>


        <div class="card project-detail-content">


            <p class="section-label">
                TECHNOLOGY
            </p>

            <p class="project-detail-technology">

                <%= HtmlUtil.escape(
                        selectedWork.getTechnologies()) %>

            </p>


            <div class="project-detail-section">

                <h3>
                    概要
                </h3>

                <p>
                    <%= HtmlUtil.escape(
                            selectedWork.getDescription()) %>
                </p>

            </div>


            <%
                if (
                    selectedWork.getDevelopmentPeriod() != null
                    &&
                    !selectedWork
                        .getDevelopmentPeriod()
                        .isBlank()
                ) {
            %>

            <div class="project-detail-section">

                <h3>
                    制作期間
                </h3>

                <p>
                    <%= HtmlUtil.escape(
                            selectedWork.getDevelopmentPeriod()) %>
                </p>

            </div>

            <%
                }
            %>


            <%
                if (
                    selectedWork.getFeatures() != null
                    &&
                    !selectedWork
                        .getFeatures()
                        .isBlank()
                ) {
            %>

            <div class="project-detail-section">

                <h3>
                    実装機能
                </h3>


                <div class="feature-tags">

                    <%
                        String[] featureArray =
                            selectedWork
                                .getFeatures()
                                .split("、");

                        for (
                            String feature
                                : featureArray
                        ) {

                            if (
                                feature != null
                                &&
                                !feature.isBlank()
                            ) {
                    %>

                    <span class="feature-tag">

                        <%= HtmlUtil.escape(
                                feature.trim()) %>

                    </span>

                    <%
                            }
                        }
                    %>

                </div>

            </div>

            <%
                }
            %>


            <%
                if (
                    selectedWork
                        .getDevelopmentPoint()
                        != null
                    &&
                    !selectedWork
                        .getDevelopmentPoint()
                        .isBlank()
                ) {
            %>

            <div class="project-detail-section">

                <h3>
                    工夫した点
                </h3>

                <p>
                    <%= HtmlUtil.escape(
                        selectedWork
                            .getDevelopmentPoint()) %>
                </p>

            </div>

            <%
                }
            %>


            <%
                if (
                    selectedWork.getChallenge()
                        != null
                    &&
                    !selectedWork
                        .getChallenge()
                        .isBlank()
                ) {
            %>

            <div class="project-detail-section">

                <h3>
                    苦労した点・課題
                </h3>

                <p>
                    <%= HtmlUtil.escape(
                            selectedWork.getChallenge()) %>
                </p>

            </div>

            <%
                }
            %>


            <div class="project-detail-section">

                <div class="project-meta">

                    <span>
                        PROJECT ID
                    </span>

                    <strong>
                        #<%= selectedWork.getId() %>
                    </strong>

                </div>

            </div>


            <div class="work-links">


                <%
                    if (
                        isSafeHttpUrl(
                            selectedWork
                                .getGithubUrl()
                        )
                    ) {
                %>

                <a
                    href="<%= HtmlUtil.escape(selectedWork.getGithubUrl()) %>"
                    target="_blank"
                    rel="noopener noreferrer"
                    class="button">

                    GitHub

                </a>

                <%
                    }
                %>


                <%
                    if (
                        isSafeHttpUrl(
                            selectedWork
                                .getDemoUrl()
                        )
                    ) {
                %>

                <a
                    href="<%= HtmlUtil.escape(selectedWork.getDemoUrl()) %>"
                    target="_blank"
                    rel="noopener noreferrer"
                    class="button">

                    DEMO

                </a>

                <%
                    }
                %>


                <button
                    type="button"
                    class="button button-secondary page-button"
                    data-page="works">

                    ← BACK TO WORKS

                </button>

            </div>

        </div>

    </div>


    <%
        if (workImages != null
                && !workImages.isEmpty()) {
    %>

    <section class="project-gallery">

        <p class="section-label">
            SCREENSHOTS
        </p>

        <h2>
            Application Screens
        </h2>

        <p>
            実装した主要画面です。
            画像をクリックすると拡大表示できます。
        </p>


        <div class="project-gallery-grid">

            <%
                for (
                    WorkImage image
                        : workImages
                ) {

                    String caption =
                        image.getCaption();

                    if (
                        caption == null
                        ||
                        caption.isBlank()
                    ) {
                        caption =
                            selectedWork
                                .getTitle();
                    }
            %>


            <button
                type="button"
                class="gallery-item js-gallery-open">

                <img
                    src="<%= request.getContextPath() %>/<%= HtmlUtil.escape(image.getImagePath()) %>"
                    alt="<%= HtmlUtil.escape(caption) %>"
                    class="gallery-image">

                <span class="gallery-caption">

                    <%= HtmlUtil.escape(
                            caption) %>

                </span>

            </button>


            <%
                }
            %>

        </div>

    </section>

    <%
        }
    %>


    <%
        }
    %>

</section>


<!-- ==================================================
     LEARNING
================================================== -->

<section
    id="learning"
    class="page
    <%= "learning".equals(currentPage)
            ? "active-page"
            : "" %>">

    <p class="section-label">
        CURRENTLY LEARNING
    </p>

    <h2>
        LEARNING
    </h2>


    <div class="learning-grid">


        <div class="card">

            <p class="card-number">
                01
            </p>

            <h3>
                Java Web Development
            </h3>

            <p>
                Java / Servlet / JSP / JDBC /
                MySQLを利用した
                Webアプリケーション開発。
            </p>

        </div>


        <div class="card">

            <p class="card-number">
                02
            </p>

            <h3>
                Database
            </h3>

            <p>
                SQL、JOIN、GROUP BY、
                HAVING、サブクエリなどを
                学習しています。
            </p>

        </div>


        <div class="card">

            <p class="card-number">
                03
            </p>

            <h3>
                Server / Network
            </h3>

            <p>
                Linux、Apache、
                TCP/IP、ネットワーク、
                セキュリティについて
                学習しています。
            </p>

        </div>


        <div class="card">

            <p class="card-number">
                04
            </p>

            <h3>
                Certification
            </h3>

            <p>
                ITパスポート試験に合格し、
                現在は基本情報技術者試験に向けて
                学習を継続しています。
            </p>

        </div>

    </div>

</section>


<!-- ==================================================
     SYSTEM
================================================== -->

<section
    id="system"
    class="page
    <%= "system".equals(currentPage)
            ? "active-page"
            : "" %>">


    <p class="section-label">
        ABOUT THIS APPLICATION
    </p>

    <h2>
        SYSTEM
    </h2>

    <p>
        このポートフォリオ自体を
        Java Webアプリケーションとして制作しています。
    </p>


    <div class="skill-grid">


        <div class="card">

            <h3>
                Backend
            </h3>

            <p>
                Java
            </p>

        </div>


        <div class="card">

            <h3>
                Controller
            </h3>

            <p>
                Servlet
            </p>

        </div>


        <div class="card">

            <h3>
                View
            </h3>

            <p>
                JSP
            </p>

        </div>


        <div class="card">

            <h3>
                Repository
            </h3>

            <p>
                Java Repository Class
            </p>

        </div>


        <div class="card">

            <h3>
                Database Access
            </h3>

            <p>
                JDBC
            </p>

        </div>


        <div class="card">

            <h3>
                Database
            </h3>

            <p>
                MySQL
            </p>

        </div>


        <div class="card">

            <h3>
                Application Server
            </h3>

            <p>
                Apache Tomcat
            </p>

        </div>

    </div>


    <!-- APPLICATION FLOW -->

    <div class="card architecture-card">

        <p class="section-label">
            ARCHITECTURE
        </p>

        <h3>
            Application Flow
        </h3>


        <p>
            <strong>
                Request
            </strong>
        </p>


        <div class="architecture-flow">

            <span>Browser</span>
            <strong>→</strong>

            <span>Servlet</span>
            <strong>→</strong>

            <span>Repository</span>
            <strong>→</strong>

            <span>JDBC</span>
            <strong>→</strong>

            <span>MySQL</span>

        </div>


        <p>
            <strong>
                Response
            </strong>
        </p>


        <div class="architecture-flow">

            <span>MySQL</span>
            <strong>→</strong>

            <span>JDBC</span>
            <strong>→</strong>

            <span>Repository</span>
            <strong>→</strong>

            <span>Servlet</span>
            <strong>→</strong>

            <span>JSP</span>
            <strong>→</strong>

            <span>Browser</span>

        </div>

    </div>


    <!-- DEPLOYMENT FLOW -->

    <div class="card architecture-card">

        <p class="section-label">
            DEPLOYMENT
        </p>

        <h3>
            Deployment Flow
        </h3>


        <div class="architecture-flow">

            <span>GitHub</span>
            <strong>→</strong>

            <span>Railway</span>
            <strong>→</strong>

            <span>Docker</span>
            <strong>→</strong>

            <span>Tomcat</span>
            <strong>→</strong>

            <span>Portfolio</span>

        </div>


        <p>
            GitHubのmainブランチとRailwayを連携し、
            DockerfileをもとにDockerイメージをビルドして、
            Tomcat上でWebアプリケーションを実行しています。
        </p>

        <p>
            MySQLはRailwayのPrivate Networkingを利用して接続し、
            データベース接続情報は
            Railwayの環境変数から取得しています。
        </p>

    </div>


    <!-- DATABASE -->

    <div class="card">

        <h3>
            Database Driven
        </h3>

        <p>
            WORKSに表示する制作物は
            MySQLデータベースで管理しています。
        </p>

        <p>
            WorkRepositoryからJDBCを利用して
            データを取得し、
            Servletを経由してJSPへ渡しています。
        </p>

        <p>
            データベースを変更することで、
            Javaコードを直接変更せずに
            WORKSの内容を更新できます。
        </p>

    </div>


    <!-- SECURITY -->

    <div class="card">

        <h3>
            Security
        </h3>

        <p>
            データベースの接続情報は
            Javaソースコードへ直接記述せず、
            環境変数から取得しています。
        </p>

        <p>
            SQL実行にはPreparedStatementを利用し、
            SQLインジェクション対策を意識しています。
        </p>

        <p>
            データベースから画面へ出力する文字列は
            HTMLエスケープを行い、
            XSS対策を実施しています。
        </p>

        <p>
            GitHubやDEMOなどの外部リンクは、
            HTTP / HTTPSのみを許可する
            URL検証を行っています。
        </p>

        <p>
            本番環境のMySQLは
            RailwayのPrivate Networkingを利用し、
            通常はPublic Accessを無効にしています。
        </p>

    </div>

</section>


<!-- ==================================================
     LINKS
================================================== -->

<section
    id="contact"
    class="page
    <%= "contact".equals(currentPage)
            ? "active-page"
            : "" %>">


    <p class="section-label">
        PORTFOLIO / SOURCE CODE
    </p>

    <h2>
        LINKS
    </h2>


    <div class="contact-layout">


        <!-- GITHUB -->

        <div class="card">

            <h3>
                GitHub
            </h3>

            <p>
                Java Webアプリケーションや
                学習成果物のソースコードを
                GitHubで公開しています。
            </p>

            <a
                href="https://github.com/klvs273/KS-Portfolio"
                target="_blank"
                rel="noopener noreferrer"
                class="button">

                VIEW GITHUB

            </a>

        </div>


        <!-- PORTFOLIO -->

        <div class="card">

            <h3>
                Portfolio
            </h3>

            <p>
                本サイト自体も
                Java / Servlet / JSP / JDBC /
                MySQLを利用して制作し、
                Docker・Railwayを利用して
                公開しているポートフォリオ作品です。
            </p>

        </div>

    </div>

</section>


</main>


<!-- ==================================================
     FOOTER
================================================== -->

<footer class="footer">

    <p>
        © 2026 KS Portfolio
    </p>

    <p>
        Built with Java / Servlet / JSP / JDBC / MySQL
    </p>

</footer>


<!-- ==================================================
     IMAGE LIGHTBOX
================================================== -->

<div
    id="imageLightbox"
    class="image-lightbox"
    aria-hidden="true">


    <button
        type="button"
        id="lightboxClose"
        class="lightbox-close"
        aria-label="画像を閉じる">

        ×

    </button>


    <button
        type="button"
        id="lightboxPrev"
        class="lightbox-nav lightbox-prev"
        aria-label="前の画像">

        ‹

    </button>


    <div class="lightbox-content">

        <img
            id="lightboxImage"
            src=""
            alt="">

        <p
            id="lightboxCaption"
            class="lightbox-caption">
        </p>

    </div>


    <button
        type="button"
        id="lightboxNext"
        class="lightbox-nav lightbox-next"
        aria-label="次の画像">

        ›

    </button>

</div>


<!-- ==================================================
     JAVASCRIPT
================================================== -->

<script
    src="${pageContext.request.contextPath}/js/app.js">
</script>


</body>

</html>