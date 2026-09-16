package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Work;
import model.WorkImage;

public class WorkRepository {

    // ==========================================
    // DB接続情報
    // 環境変数から取得
    // ==========================================

    private static final String URL =
            System.getenv("PORTFOLIO_DB_URL");

    private static final String USER =
            System.getenv("PORTFOLIO_DB_USER");

    private static final String PASSWORD =
            System.getenv("PORTFOLIO_DB_PASSWORD");


    // ==========================================
    // 作品一覧取得
    // ==========================================

    public List<Work> findAll()
            throws SQLException {

        checkEnvironmentVariables();

        loadDriver();


        List<Work> works =
                new ArrayList<>();


        String sql =
                "SELECT "
                + "id, "
                + "title, "
                + "technologies, "
                + "description, "
                + "image_url, "
                + "github_url, "
                + "demo_url "
                + "FROM works "
                + "ORDER BY display_order";


        try (
            Connection connection =
                    DriverManager.getConnection(
                        URL,
                        USER,
                        PASSWORD
                    );

            PreparedStatement statement =
                    connection.prepareStatement(
                        sql
                    );

            ResultSet resultSet =
                    statement.executeQuery()
        ) {

            while (resultSet.next()) {

                Work work =
                        new Work(

                            resultSet.getInt(
                                "id"
                            ),

                            resultSet.getString(
                                "title"
                            ),

                            resultSet.getString(
                                "technologies"
                            ),

                            resultSet.getString(
                                "description"
                            ),

                            resultSet.getString(
                                "image_url"
                            ),

                            resultSet.getString(
                                "github_url"
                            ),

                            resultSet.getString(
                                "demo_url"
                            )
                        );


                works.add(work);
            }
        }


        return works;
    }


    // ==========================================
    // ID指定で作品を1件取得
    // ==========================================

    public Work findById(int id)
            throws SQLException {

        checkEnvironmentVariables();

        loadDriver();


        String sql =
                "SELECT "
                + "id, "
                + "title, "
                + "technologies, "
                + "description, "
                + "image_url, "
                + "github_url, "
                + "demo_url, "
                + "features, "
                + "development_point, "
                + "challenge, "
                + "development_period "
                + "FROM works "
                + "WHERE id = ?";


        try (
            Connection connection =
                    DriverManager.getConnection(
                        URL,
                        USER,
                        PASSWORD
                    );

            PreparedStatement statement =
                    connection.prepareStatement(
                        sql
                    )
        ) {

            statement.setInt(
                1,
                id
            );


            try (
                ResultSet resultSet =
                        statement.executeQuery()
            ) {

                if (resultSet.next()) {

                    return new Work(

                        resultSet.getInt(
                            "id"
                        ),

                        resultSet.getString(
                            "title"
                        ),

                        resultSet.getString(
                            "technologies"
                        ),

                        resultSet.getString(
                            "description"
                        ),

                        resultSet.getString(
                            "image_url"
                        ),

                        resultSet.getString(
                            "github_url"
                        ),

                        resultSet.getString(
                            "demo_url"
                        ),

                        resultSet.getString(
                            "features"
                        ),

                        resultSet.getString(
                            "development_point"
                        ),

                        resultSet.getString(
                            "challenge"
                        ),

                        resultSet.getString(
                            "development_period"
                        )
                    );
                }
            }
        }


        return null;
    }

 // ==========================================
 // 作品画像一覧取得
 // ==========================================

 public List<WorkImage> findImagesByWorkId(int workId)
         throws SQLException {

     checkEnvironmentVariables();

     loadDriver();


     List<WorkImage> images =
             new ArrayList<>();


     String sql =
             "SELECT "
             + "id, "
             + "work_id, "
             + "image_path, "
             + "caption, "
             + "display_order "
             + "FROM work_images "
             + "WHERE work_id = ? "
             + "ORDER BY display_order";


     try (
         Connection connection =
                 DriverManager.getConnection(
                     URL,
                     USER,
                     PASSWORD
                 );

         PreparedStatement statement =
                 connection.prepareStatement(sql)
     ) {

         statement.setInt(
             1,
             workId
         );


         try (
             ResultSet resultSet =
                     statement.executeQuery()
         ) {

             while (resultSet.next()) {

                 WorkImage image =
                         new WorkImage(

                             resultSet.getInt(
                                 "id"
                             ),

                             resultSet.getInt(
                                 "work_id"
                             ),

                             resultSet.getString(
                                 "image_path"
                             ),

                             resultSet.getString(
                                 "caption"
                             ),

                             resultSet.getInt(
                                 "display_order"
                             )
                         );


                 images.add(image);
             }
         }
     }


     return images;
 }

    // ==========================================
    // JDBCドライバ読み込み
    // ==========================================

    private void loadDriver()
            throws SQLException {

        try {

            Class.forName(
                "com.mysql.cj.jdbc.Driver"
            );

        } catch (ClassNotFoundException e) {

            throw new SQLException(
                "MySQL JDBCドライバを読み込めませんでした。",
                e
            );
        }
    }


    // ==========================================
    // 環境変数チェック
    // ==========================================

    private void checkEnvironmentVariables()
            throws SQLException {


        if (URL == null
                || URL.isBlank()) {

            throw new SQLException(
                "PORTFOLIO_DB_URL が設定されていません。"
            );
        }


        if (USER == null
                || USER.isBlank()) {

            throw new SQLException(
                "PORTFOLIO_DB_USER が設定されていません。"
            );
        }


        if (PASSWORD == null
                || PASSWORD.isBlank()) {

            throw new SQLException(
                "PORTFOLIO_DB_PASSWORD が設定されていません。"
            );
        }
    }
}