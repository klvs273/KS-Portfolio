package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Work;
import model.WorkImage;
import repository.WorkRepository;

@WebServlet("")
public class PortfolioServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // ==========================================
        // 文字コード
        // ==========================================

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");


        // ==========================================
        // Repository
        // ==========================================

        WorkRepository repository =
                new WorkRepository();


        try {

            // ==========================================
            // 作品一覧取得
            // ==========================================

            List<Work> works =
                    repository.findAll();

            request.setAttribute(
                    "works",
                    works
            );


            // ==========================================
            // 現在ページ取得
            // ==========================================

            String page =
                    request.getParameter("page");

            if (page == null
                    || page.isBlank()) {

                page = "home";
            }


            // ==========================================
            // 作品詳細ページ
            // ==========================================

            if ("detail".equals(page)) {

                String idParameter =
                        request.getParameter("id");


                // ------------------------------------------
                // ID未指定
                // ------------------------------------------

                if (idParameter == null
                        || idParameter.isBlank()) {

                    response.sendError(
                            HttpServletResponse.SC_BAD_REQUEST,
                            "作品IDが指定されていません。"
                    );

                    return;
                }


                // ------------------------------------------
                // ID数値変換
                // ------------------------------------------

                int id;

                try {

                    id =
                        Integer.parseInt(
                                idParameter
                        );

                } catch (NumberFormatException e) {

                    response.sendError(
                            HttpServletResponse.SC_BAD_REQUEST,
                            "作品IDが正しくありません。"
                    );

                    return;
                }


                // ------------------------------------------
                // 0以下のIDを拒否
                // ------------------------------------------

                if (id <= 0) {

                    response.sendError(
                            HttpServletResponse.SC_BAD_REQUEST,
                            "作品IDが正しくありません。"
                    );

                    return;
                }


                // ==========================================
                // 作品詳細取得
                // ==========================================

                Work selectedWork =
                        repository.findById(id);


                // ------------------------------------------
                // 該当作品なし
                // ------------------------------------------

                if (selectedWork == null) {

                    response.sendError(
                            HttpServletResponse.SC_NOT_FOUND,
                            "作品が見つかりません。"
                    );

                    return;
                }


                request.setAttribute(
                        "selectedWork",
                        selectedWork
                );


                // ==========================================
                // 作品画像取得
                // ==========================================

                List<WorkImage> workImages =
                        repository.findImagesByWorkId(id);

                request.setAttribute(
                        "workImages",
                        workImages
                );
            }


            // ==========================================
            // 現在ページ
            // ==========================================

            request.setAttribute(
                    "currentPage",
                    page
            );


            // ==========================================
            // JSPへforward
            // ==========================================

            request
                .getRequestDispatcher(
                        "/WEB-INF/views/index.jsp"
                )
                .forward(
                        request,
                        response
                );


        } catch (SQLException e) {

            // ==========================================
            // Railway デバッグログ
            //
            // パスワードそのものは表示せず、
            // 環境変数が存在するかだけ確認する。
            // ==========================================

            System.err.println();
            System.err.println(
                    "========== KS DATABASE ERROR =========="
            );


            String dbUrl =
                    System.getenv(
                            "PORTFOLIO_DB_URL"
                    );

            String dbUser =
                    System.getenv(
                            "PORTFOLIO_DB_USER"
                    );

            String dbPassword =
                    System.getenv(
                            "PORTFOLIO_DB_PASSWORD"
                    );


            System.err.println(
                    "PORTFOLIO_DB_URL set: "
                    + isEnvironmentVariableSet(
                            dbUrl
                    )
            );

            System.err.println(
                    "PORTFOLIO_DB_USER set: "
                    + isEnvironmentVariableSet(
                            dbUser
                    )
            );

            System.err.println(
                    "PORTFOLIO_DB_PASSWORD set: "
                    + isEnvironmentVariableSet(
                            dbPassword
                    )
            );


            // ==========================================
            // SQLExceptionの内容
            // ==========================================

            System.err.println(
                    "SQLException message: "
                    + e.getMessage()
            );

            System.err.println(
                    "SQLState: "
                    + e.getSQLState()
            );

            System.err.println(
                    "ErrorCode: "
                    + e.getErrorCode()
            );


            // ==========================================
            // StackTrace
            // ==========================================

            e.printStackTrace(
                    System.err
            );


            System.err.println(
                    "======================================="
            );

            System.err.println();


            // ==========================================
            // 500エラーへ
            // ==========================================

            throw new ServletException(
                    "作品データの取得に失敗しました。",
                    e
            );
        }
    }


    // ==========================================
    // 環境変数存在チェック
    // ==========================================

    private boolean isEnvironmentVariableSet(
            String value) {

        return value != null
                && !value.isBlank();
    }
}